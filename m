From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Mar 2013 17:54:37 +0100
Subject: [Buildroot] [PATCH] Add Qt5 packages
In-Reply-To: <5130D9D8.5000603@je-eigen-domein.nl>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <513011C9.8030301@je-eigen-domein.nl>
 <20130301100844.2f7b014a@skate>
 <5130D9D8.5000603@je-eigen-domein.nl>
Message-ID: <20130301175437.085605b5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Fri, 01 Mar 2013 17:39:52 +0100, Floris Bos wrote:

> > If so, then I can include a path that makes fonts.path be 
> > $$[QT_INSTALL_PREFIX]/share/fonts/. But Qt has some fonts in 
> > lib/fonts/, so maybe we should research how to install them, at least 
> > optionally, because they have some fonts in the special Qt format, 
> > which may be useful if you don't have a TTF font renderer available. 
> 
> Sounds good to me.

Do you plan on researching how to get the fonts bundled with Qt
installed, or you want me to look into that?


> Well, I never really understood the need for the glue code in the first 
> place either.
> Would rather have seen that they filled a bug report with the GPU 
> vendor, and questioned why one needs to call some vendor specific 
> function like bcm_host_init(), instead of just the standardized function 
> eglInitialize() before
> any EGL/OpenGL ES function works...
> And used some runtime detection system for vendor specific extras like 
> hardware accelerated mouse cursor.
> So that ARM Linux distributions could ship universal Qt packages that 
> could work on more then one device.

Indeed.

> Anyway, just filling in the location of the glue code in the buildroot 
> qmake.conf when the rpi-userland package is selected might be the most 
> practical solution.
> Will submit a sample patch to illustrate shortly.

That would be very nice!

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
