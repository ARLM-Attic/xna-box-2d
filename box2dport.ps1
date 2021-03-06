function CPPtoCSharp($file)
{
    get-content $file | 
    % {$_ -creplace 'm_', '_' } |
    % {$_ -creplace '->', '.' } |
    % {$_ -creplace 'float32', 'float' } |
    % {$_ -creplace 'int32', 'int' } |
    % {$_ -creplace 'b2BodyDef bd;', 'BodyDef bd = new BodyDef();' } |
    % {$_ -creplace 'b2BodyDef', 'BodyDef' } |
    % {$_ -creplace 'b2Body\*', 'Body' } |
    % {$_ -creplace 'b2PolygonShape shape;', 'PolygonShape shape = new PolygonShape();' } |
    % {$_ -creplace 'b2PolygonShape', 'PolygonShape' } |    
    % {$_ -creplace 'b2CircleShape shape;', 'CircleShape shape = new CircleShape();' } |
    % {$_ -creplace 'b2CircleShape', 'CircleShape' } |
    % {$_ -creplace  "\(b2Vec2", "(new Vector2" } |
    % {$_ -creplace ', b2Vec2', ', new Vector2' } |
    % {$_ -creplace 'b2Vec2', 'Vector2' } |
    % {$_ -creplace '&shape', 'shape' } |
    % {$_ -creplace '&bd', 'bd' } |
    % {$_ -creplace 'b2FixtureDef fd;', 'FixtureDef fd = new FixtureDef();' } |
    % {$_ -creplace 'b2FixtureDef', 'FixtureDef' } |
    % {$_ -creplace '&fd', 'fd' } |
    % {$_ -creplace 'NULL', 'null' } |
    % {$_ -creplace 'b2Assert', 'Debug.Assert' } |
    % {$_ -creplace 'RandomFloat', 'Rand.RandomFloat' } |
    % {$_ -creplace 'b2_dynamicBody', 'BodyType.Dynamic' } |
    % {$_ -creplace 'b2_pi', '(float)Math.PI' } |
    % {$_ -creplace 'cosf', '(float)Math.Cos' } |
    % {$_ -creplace 'sinf', '(float)Math.Sin' } |
    % {$_ -creplace 'sqrtf', '(float)Math.Sqrt' } |    
    % {$_ -creplace 'b2Abs', 'Math.Abs' } |
    % {$_ -creplace 'b2Shape', 'Shape' } |
    % {$_ -creplace 'b2EdgeShape', 'EdgeShape' } |
    % {$_ -creplace 'b2LoopShape', 'LoopShape' } |
    % {$_ -creplace ' const;', '' } |
    % {$_ -creplace ' const ', ' ' } |
    % {$_ -creplace ' const', ' ' } |
    % {$_ -creplace 'Shape*', 'Shape' } |
    % {$_ -creplace 'b2MulT\(', 'MathUtils.MultiplyT(ref ' } |
    % {$_ -creplace 'b2RayCastOutput', 'RayCastOutput' } |
    % {$_ -creplace 'b2RayCastInput', 'RayCastInput' } |
    % {$_ -creplace 'b2Transform', 'Transform' } |
    % {$_ -creplace 'e_edge', 'ShapeType.Edge' } |
    % {$_ -creplace 'e_loop', 'ShapeType.Loop' } |
    % {$_ -creplace ' b2_polygonRadius', ' Settings.b2_polygonRadius' } |
    % {$_ -creplace 'b2Dot', 'Vector2.Dot' } |
    % {$_ -creplace 'b2AABB', 'AABB' } |
    % {$_ -creplace 'b2MassData', 'MassData' } |
    % {$_ -creplace 'b2Mul\(', 'MathUtils.Multiply(ref ' } |
    % {$_ -creplace 'b2Min', 'Vector2.Min' } |
    % {$_ -creplace 'b2Max', 'Vector2.Max' } |
    % {$_ -creplace 'uint8', 'byte' } |
    % {$_ -creplace 'b2BroadPhase', 'BroadPhase' } |
    % {$_ -creplace 'e_nullProxy', 'NullProxy' } |
    % {$_ -creplace '::', '.' } |
    % {$_ -creplace 'b2ContactFeature', 'ContactFeature' } |
    % {$_ -creplace 'e_vertex', 'Vertex' } |
    % {$_ -creplace 'e_face', 'Face' } |
    % {$_ -creplace 'b2DynamicTreeNode', 'DynamicTreeNode' } |
    % {$_ -creplace 'b2_nullNode', 'NullNode' } |
    % {$_ -creplace 'b2Fixture', 'Fixture' } |
    % {$_ -creplace 'b2_staticBody', 'BodyType.Static' } |
    % {$_ -creplace 'b2_kinematicBody', 'BodyType.Kinematic' } |
    % {$_ -creplace 'b2_dynamicBody', 'BodyType.Dynamic' } |
    % {$_ -creplace 'id.cf', 'id.Features' } |
    % {$_ -creplace 'b2ClipVertex', 'ClipVertex' } |
    % {$_ -creplace 'b2ManifoldPoint', 'ManifoldPoint' } |
    set-content convert.txt
    
    get-content convert.txt | set-content $file
    del convert.txt
}