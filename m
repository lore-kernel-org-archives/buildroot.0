From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 21 Jun 2014 15:23:35 +0200
Subject: [Buildroot] Help about gstreamer h264 in buildroot
In-Reply-To: <20140621150459.267bce66@free-electrons.com>
References: <539C13BA.5000106@gmail.com>	<20140614141451.6780163c@free-electrons.com>	<53A566AE.7020800@gmail.com>
 <20140621150459.267bce66@free-electrons.com>
Message-ID: <53A58757.8030701@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 21/06/2014 15:04, Thomas Petazzoni ha scritto:
> I don't confirm anything, it just didn't build here, with the error 
> messages that I've posted. 

Ok, you confirm it doesn't build there. I confirm it doesn't build here.

> You shouldn't try to "skip around", but instead you should help us to 
> _fix_ those issues. The support for Qt5+OpenGL is still fairly, and 
> since there are multiple OpenGL implementation, generally one for each 
> platform, we haven't yet tested and fixed all the possible 
> combinations. It is thanks to bug reports provided by users like you 
> that we can progressively fix those issues, and provide a build system 
> that is more and more capable to build all configurations correctly 
> out-of-the-box. Best regards, Thomas 

I understand your point-of-view.
I hope you also understand the frustration of a normal user which try to 
configure its own embedded system.

In the website of buildroot I read:

"Is very easy to set up, thanks to its menuconfig, gconfig and xconfig 
configuration interfaces, familiar to all embedded Linux developers. 
Building a basic embedded Linux system with Buildroot typically takes 
15-30 minutes."

I never had a working buildroot environment since several months! Of 
course I know I'm not an expert so I cannot fix the bugs by myself.
I'm talking about a standard embedded systems (i.MX6 or RPi) with very 
common packages (Qt5, gstreamer).

I also understand no charge is required and in fact I don't expect 
anything from the buildroot staff! But for a user it's not an option to 
delay for days or weeks a project because buildroot doesn't build.

So I'm just wondering if it is possible to know which combination of 
kernel/buildroot version leads to a working environment with basic 
packages. For my current project based upon RPi I need only:

- common utility: ssh (dropbear or openssh), lighttpd, etc (no problem 
here!)
- Qt5 (all modules, egl platform)
- gstreamer with mp3, mp4 h264 and qtmultimedia support

By the way, I don't need Qt5.3, I could use 5.2 as well.

Best regards
Marco
