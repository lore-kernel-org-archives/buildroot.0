From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 30 Mar 2014 15:47:43 +0200
Subject: [Buildroot] qt5, eglfs and xcb
Message-ID: <5338207F.9010807@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
when you try to build qt5 with the X support (xcb), selecting one of the 
following modules: qtquick*, qt5declarative, qt5graphicaleffects and 
qt5multimedia, leads to force the selection of the eglfs support.

After three days of build failures (due to the same constants defined 
both from xbc and eglfs) I asked an aid to a company which offer a 
technical support about Qt. The says only qtquick2 requires the opengl 
acceleration and this one is provided also from xbc.

So it shouldn't required at all the eglfs plugin if you're using X.

Please, might you verify this?
If they are right, could you fix the dependencies so we can build a 
working buildroot image with Qt5 and xcb?

Thanks!
Marco
