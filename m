From: Steffen Schulz <pepe_ml@gmx.net>
Date: Wed, 6 May 2009 14:42:43 +0200
Subject: [Buildroot] X11 and buildroot..
Message-ID: <20090506124243.GB2496@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


is there any buildroot configuration that gives me a working X11 using
the framebuffer?

I saw updates in the X11 area again for the current rc1, but I still
fail to compile anything using X11.


Currently, if I select tinyX and xserver, xfont-encodings will complain
about missing mkfontscale. If I add that to the dependencies, it still
complains since the binary is not copied to staging. Even then it seems
some shared libraries are missing that ldd fails to tell me about.

Qtopia simply exists with

The system floating point format could not be detected.
This may cause data to be generated in a wrong format
Turn on verbose messaging (-v) to see the final report.
X/Open Large File support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.


I tried this months ago and ran from one problem into the other, with
no end in sight. I'm not particulary good with autotools, but the
regular updates seem to suggest that some people got this working?


Thanks,
Steffen
-- 
pepe at unixfan.net                            gpg --recv-key A04D7875
Key fingerprint: B805 57BE E4AF 0104 CC51  77A1 CE6F 8D46 A04D 7875
