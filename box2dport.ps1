function CPPtoCSharp($file)
{
    get-content $file | 
    % {$_ -replace 'm_', '_' } |
    % {$_ -replace '->', '.' } |
    % {$_ -replace 'float32', 'float' } |
    % {$_ -replace 'int32', 'int' } |
    % {$_ -replace 'b2BodyDef bd;', 'BodyDef bd = new BodyDef();' } |
    % {$_ -replace 'b2BodyDef', 'BodyDef' } |
    % {$_ -replace 'b2Body\*', 'Body' } |
    % {$_ -replace 'b2PolygonShape shape;', 'PolygonShape shape = new PolygonShape();' } |
    % {$_ -replace 'b2PolygonShape', 'PolygonShape' } |    
    % {$_ -replace 'b2CircleShape shape;', 'CircleShape shape = new CircleShape();' } |
    % {$_ -replace 'b2CircleShape', 'CircleShape' } |
    % {$_ -replace  "\(b2Vec2", "(new Vector2" } |
    % {$_ -replace ', b2Vec2', ', new Vector2' } |
    % {$_ -replace 'b2Vec2', 'Vector2' } |
    % {$_ -replace '&shape', 'shape' } |
    % {$_ -replace '&bd', 'bd' } |
    % {$_ -replace 'b2FixtureDef fd;', 'FixtureDef fd = new FixtureDef();' } |
    % {$_ -replace 'b2FixtureDef', 'FixtureDef' } |
    % {$_ -replace '&fd', 'fd' } |
    % {$_ -replace 'NULL', 'null' } |
    % {$_ -replace 'b2Assert', 'Debug.Assert' } |
    % {$_ -replace 'RandomFloat', 'Rand.RandomFloat' } |
    % {$_ -replace 'b2_dynamicBody', 'BodyType.Dynamic' } |
    % {$_ -replace 'b2_pi', '(float)Math.PI' } |
    % {$_ -replace 'cosf', '(float)Math.Cos' } |
    % {$_ -replace 'sinf', '(float)Math.Sin' } |
    % {$_ -replace 'sqrtf', '(float)Math.Sqrt' } |    
    % {$_ -replace 'b2Abs', 'Math.Abs' } |
    set-content convert.txt
    
    get-content convert.txt | set-content $file
    del convert.txt
}