From: Piyush Verma <piyush.pv@gmail.com>
Date: Wed, 19 Feb 2020 02:38:40 -0600 (CST)
Subject: [Buildroot] Qt Quick without OpenGL ? Swiftshader or Qt Quick 2D
 Renderer
Message-ID: <1582101520449-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I have to use Qt Quick without OpenGL, I have searched online and found few
optoin.

SwiftShader is virtual opengles library which simulate GPU on CPU. is it
possible to add SwitftShader in buildroot?

How to configure SwitftShader as it support opengles so that option of qt
which depend on opengles get activated.


Option 2 is Qt Quick 2d renderer but it's can only use with QT Version older
that 5.7


Any suggestion which would would be easy and how to add that support.


Thanks & Regards
Piyush Verma




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
