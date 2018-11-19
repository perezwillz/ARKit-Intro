//
//  ViewController.swift
//  MakingARMoon
//
//  Created by Perez Willie Nwobu on 11/17/18.
//  Copyright © 2018 Perez Willie Nwobu. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        let sphere = SCNSphere(radius: 0.2)
        
        let sunSphere = SCNSphere(radius: 0.99)
        
        let material = SCNMaterial()
        let sunMaterial = SCNMaterial()
        
        
        material.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        sunMaterial.diffuse.contents = UIImage(named: "art.scnassets/sun.jpg")
        
        sphere.materials = [material]
        sunSphere.materials = [sunMaterial]
        
        //Node
        
        let node = SCNNode()
        let sunNode = SCNNode()
        
        
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        sunNode.position = SCNVector3(x: 1.2, y: 0.5, z: -0.10)
        //placing moon on the position we created.
        
        node.geometry = sphere
        sunNode.geometry = sunSphere
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.scene.rootNode.addChildNode(sunNode)
        
        
        sceneView.automaticallyUpdatesLighting = true
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
