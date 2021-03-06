﻿/*
* Box2D.XNA port of Box2D:
* Copyright (c) 2009 Brandon Furtwangler, Nathan Furtwangler
*
* Original source Box2D:
* Copyright (c) 2006-2009 Erin Catto http://www.gphysics.com 
* 
* This software is provided 'as-is', without any express or implied 
* warranty.  In no event will the authors be held liable for any damages 
* arising from the use of this software. 
* Permission is granted to anyone to use this software for any purpose, 
* including commercial applications, and to alter it and redistribute it 
* freely, subject to the following restrictions: 
* 1. The origin of this software must not be misrepresented; you must not 
* claim that you wrote the original software. If you use this software 
* in a product, an acknowledgment in the product documentation would be 
* appreciated but is not required. 
* 2. Altered source versions must be plainly marked as such, and must not be 
* misrepresented as being the original software. 
* 3. This notice may not be removed or altered from any source distribution. 
*/

using Box2D.XNA.TestBed.Framework;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace Box2D.XNA.TestBed.Tests
{
    public class TimeOfImpact : Test
    {
        TimeOfImpact()
	    {
            _shapeA.SetAsBox(25.0f, 5.0f);
            _shapeB.SetAsBox(2.5f, 2.5f);
	    }

	    internal static Test Create()
	    {
		    return new TimeOfImpact();
	    }

	    public override void Step(Framework.Settings settings)
	    {
		    base.Step(settings);

		    Sweep sweepA = new Sweep();
		    sweepA.c0 = new Vector2(24.0f, -60.0f);
		    sweepA.a0 = 2.95f;
		    sweepA.c = sweepA.c0;
		    sweepA.a = sweepA.a0;
		    sweepA.localCenter = Vector2.Zero;

		    Sweep sweepB = new Sweep();
            sweepB.c0 = new Vector2(53.474274f, -50.252514f);
            sweepB.a0 = 513.36676f;
            sweepB.c = new Vector2(54.595478f, -51.083473f);
            sweepB.a = 513.62781f;
		    sweepB.localCenter = Vector2.Zero;

		    TOIInput input = new TOIInput();
            input.proxyA.Set(_shapeA, 0);
            input.proxyB.Set(_shapeB, 0);
		    input.sweepA = sweepA;
		    input.sweepB = sweepB;
            input.tMax = 1.0f;

            TOIOutput output;
		    XNA.TimeOfImpact.CalculateTimeOfImpact(out output, ref input);

            _debugDraw.DrawString(50, _textLine, "toi = {0:n}", output.t);
		    _textLine += 15;

            _debugDraw.DrawString(50, _textLine, "max toi iters = {0:n}, max root iters = {1:n}", XNA.TimeOfImpact.b2_toiMaxIters, XNA.TimeOfImpact.b2_toiMaxRootIters);
		    _textLine += 15;

            FixedArray8<Vector2> vertices = new FixedArray8<Vector2>();

		    Transform transformA;
		    sweepA.GetTransform(out transformA, 0.0f);
		    for (int i = 0; i < _shapeA._vertexCount; ++i)
		    {
			    vertices[i] = MathUtils.Multiply(ref transformA, _shapeA._vertices[i]);
		    }
		    _debugDraw.DrawPolygon(ref vertices, _shapeA._vertexCount, new Color(0.9f, 0.9f, 0.9f));

		    Transform transformB;
		    sweepB.GetTransform(out transformB, 0.0f);

            Vector2 localPoint = new Vector2(2.0f, -0.1f);   
            Vector2 rB = MathUtils.Multiply(ref transformB, localPoint) - sweepB.c0;   
            float wB = sweepB.a - sweepB.a0;  
            Vector2 vB = sweepB.c - sweepB.c0;
            Vector2 v = vB + MathUtils.Cross(wB, rB); 

		    for (int i = 0; i < _shapeB._vertexCount; ++i)
		    {
			    vertices[i] = MathUtils.Multiply(ref transformB, _shapeB._vertices[i]);
		    }
		    _debugDraw.DrawPolygon(ref vertices, _shapeB._vertexCount, new Color(0.5f, 0.9f, 0.5f));

		    sweepB.GetTransform(out transformB, output.t);
		    for (int i = 0; i < _shapeB._vertexCount; ++i)
		    {
			    vertices[i] = MathUtils.Multiply(ref transformB, _shapeB._vertices[i]);
		    }
		    _debugDraw.DrawPolygon(ref vertices, _shapeB._vertexCount, new Color(0.5f, 0.7f, 0.9f));

		    sweepB.GetTransform(out transformB, 1.0f);
		    for (int i = 0; i < _shapeB._vertexCount; ++i)
		    {
			    vertices[i] = MathUtils.Multiply(ref transformB, _shapeB._vertices[i]);
		    }
		    _debugDraw.DrawPolygon(ref vertices, _shapeB._vertexCount, new Color(0.9f, 0.5f, 0.5f));
	    }

	    PolygonShape _shapeA = new PolygonShape();
        PolygonShape _shapeB = new PolygonShape();
    }
}
