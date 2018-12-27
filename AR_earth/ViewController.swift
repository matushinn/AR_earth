//
//  ViewController.swift
//  AR_earth
//
//  Created by 大江祥太郎 on 2018/12/27.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        //ワールド座標軸を表示
        sceneView.debugOptions = [.showWorldOrigin]
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        //自転する地球のノードを作ります
        //ジオメトリ
        let earth = SCNSphere(radius: 0.2)
        //テクスチャ
        earth.firstMaterial?.diffuse.contents = UIImage(named: "earth_1024")
        //ノード
        let earthNode = SCNNode(geometry: earth)
        //アニメーション
        let action = SCNAction.rotateBy(x: 0, y: .pi*2, z: 0, duration: 10)
        earthNode.runAction(SCNAction.repeatForever(action))
        
        //位置決め
        earthNode.position = SCNVector3(0.2, 0.3, -0.2)
        //シーンに追加
        sceneView.scene.rootNode.addChildNode(earthNode)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // セッションのコンフィグを作る
        let configuration = ARWorldTrackingConfiguration()

        // セッションを追加
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // セッションを追加
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
