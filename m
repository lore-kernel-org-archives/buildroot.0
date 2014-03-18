From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 18 Mar 2014 12:07:20 +0100
Subject: [Buildroot] Error building Qt5Multimedia
In-Reply-To: <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
References: <53269705.6060805@gmail.com>
 <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
Message-ID: <532828E8.5040405@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 17/03/2014 13:24, Thomas De Schampheleire ha scritto:
> I created a build with your .config file, and did not have any error. 
> libqgsttools is present in qt5multimedia itself: 
> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so.1.0.0 
> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so.1.0 
> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so.1 
> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so 
> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.prl Did you do 
> something special in your buildroot directory/repo ? Try starting from 
> a clean environment: make clean all Best regards, Thomas 

Hi Thomas,
I tried to:

1) git clone again buildroot, in order to have a clean environment
2) copy my .config file
3) check it with make nconfig (without change anything)
4) make

It fails in the same way and under output/build/qt5multimedia-5.2.1/lib 
there are no libqgsttools* files...
I can't understand why it fails only on my pc!

Thanks!
Marco
