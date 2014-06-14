From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 14 Jun 2014 21:50:19 +0200
Subject: [Buildroot] Help about gstreamer h264 in buildroot
In-Reply-To: <20140614141451.6780163c@free-electrons.com>
References: <539C13BA.5000106@gmail.com>
 <20140614141451.6780163c@free-electrons.com>
Message-ID: <539CA77B.1050000@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 14/06/2014 14:14, Thomas Petazzoni ha scritto:
> I tried building your configuration, and here it fails with a 
> different issue:
>
> .obj/qeglfshooks_pi.o: In function 
> `QEglFSPiHooks::destroyNativeWindow(void*)': 
> qeglfshooks_pi.cpp:(.text+0x2c): undefined reference to 
> `vc_dispmanx_update_start' qeglfshooks_pi.cpp:(.text+0x38): undefined 
> reference to 

How is it possible?
Shouldn't the same configuration lead to the same output?


> That's an issue with the RPi OpenGL implementation, I think we have 
> had a couple of similar failures in the autobuilders. Maxime, Yann, 
> any suggestion? Thomas 


Well, given that this currently doesn't work in buildroot, is there 
another way to play an mp4/h264 video from Qt5?

Thanks!
Marco
