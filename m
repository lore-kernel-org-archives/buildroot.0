From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 21 Jun 2014 18:23:12 +0200
Subject: [Buildroot] Help about gstreamer h264 in buildroot
In-Reply-To: <53A58757.8030701@gmail.com>
References: <539C13BA.5000106@gmail.com>	<20140614141451.6780163c@free-electrons.com>	<53A566AE.7020800@gmail.com>
 <20140621150459.267bce66@free-electrons.com> <53A58757.8030701@gmail.com>
Message-ID: <53A5B170.2070401@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 21/06/2014 15:23, Marco Trapanese ha scritto:
> So I'm just wondering if it is possible to know which combination of 
> kernel/buildroot version leads to a working environment with basic 
> packages. For my current project based upon RPi I need only:
>
> - common utility: ssh (dropbear or openssh), lighttpd, etc (no problem 
> here!)
> - Qt5 (all modules, egl platform)
> - gstreamer with mp3, mp4 h264 and qtmultimedia support


I'm close to find a working solution.
Attached there is the current .config file.

Qt5 is working
QtMultimedia is working
gstreamer for mp3 decoding is working

I can't play only mp4 video files. GStreamer tells me there are no video 
sinks available.

Which buildroot package contains a gstreamer video sink that works 
without X (egl/gles) ?

Thanks again
Marco


-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 53785 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140621/0c4c1a5c/attachment.wsdl>
