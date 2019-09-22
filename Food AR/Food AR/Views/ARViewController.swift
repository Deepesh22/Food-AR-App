//
//  ARViewController.swift
//  Food AR
//
//  Created by Deepesh Deshmukh on 21/09/19.
//  Copyright © 2019 Deepesh Deshmukh. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ARViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    var beingDisplayed = false

    
    var path : String?
    var nodename : String?
    var details : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        beingDisplayed = false
        sceneView.delegate = self as? ARSCNViewDelegate
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        
        
        // Do any additional setup after loading the view.
        print(path!, nodename!, details!)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            let planeAnchor = anchor as! ARPlaneAnchor
            
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            
            let gridMaterial = SCNMaterial()
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
            plane.materials = [gridMaterial]
            
            let planeNode = SCNNode()
            
            planeNode.geometry = plane
            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            
            planeNode.opacity = 0
            node.addChildNode(planeNode)
            
        }else{
            return
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !beingDisplayed{
            if let touch = touches.first{
                let location = touch.location(in: sceneView)
                
                let results = sceneView.hitTest(location, types: .existingPlaneUsingExtent)
                
                if let hitresult = results.first {
                    
                    let scene = SCNScene(named: path!)!
                    
                    //print(scene)
                    //print(scene.rootNode.childNode(withName: "coke", recursively: true))
                    if let node = scene.rootNode.childNode(withName: nodename!, recursively: true){
                        node.position = SCNVector3(
                            x: hitresult.worldTransform.columns.3.x,
                            y: hitresult.worldTransform.columns.3.y,
                            z: hitresult.worldTransform.columns.3.z
                        )
                        //print("**************************************************************************************")
                        //print(hitresult)
                        sceneView.scene.rootNode.addChildNode(node)
                        
                        let textGeo = SCNText(string: details!, extrusionDepth: 4.0)
                        
                        textGeo.firstMaterial?.diffuse.contents = UIColor.black
                        let textnode = SCNNode(geometry: textGeo)
                        textnode.pivot = SCNMatrix4Rotate(textnode.pivot, Float.pi/2, 0, 0, 0)
                        textnode.position = SCNVector3(
                            x: hitresult.worldTransform.columns.3.x,
                            y: hitresult.worldTransform.columns.3.y + 0.15,
                            z: hitresult.worldTransform.columns.3.z
                        )
                        textnode.scale = SCNVector3(0.001, 0.001, 0.001)
                        sceneView.scene.rootNode.addChildNode(textnode)
                        
                        //let textaction = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 4)
                        //let textforever = SCNAction.repeatForever(textaction)
                        //textnode.runAction(textforever)
                        //textnode.runAction(SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 5))
                        
                        let objectacation = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 5)
                        let objforever = SCNAction.repeatForever(objectacation)
                        node.runAction(objforever)
                        
                        beingDisplayed = true
                    }else{
                        print("Failed")
                    }
                    
                    
                }
                
            }
            
            
        }
    }

}
