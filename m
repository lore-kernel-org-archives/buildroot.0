From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Wed, 26 Dec 2007 13:20:29 +0200
Subject: [Buildroot] x11r7 modules not installing
In-Reply-To: <47720172.3010200@brooks.nu>
References: <47720172.3010200@brooks.nu>
Message-ID: <477238FD.1080103@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lane Brooks wrote:
> I am new to buildroot, but so far it is great.
> 
> I am trying to build x11r7, but modules do not seem to get installed 
> correctly.  It seems the build script is calling 'make install-exec', 
> which does not install the modules onto the target.  Am I doing 
> something wrong?  Anyone know why my x11 modules are not getting installed?
> 
> Thanks,
> Lane Brooks
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Hi,

This is because X11 support is still experimental - you need to do manual work.
Patches are welcome.


Regards,
Ivan
