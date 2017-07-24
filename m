From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 09:13:21 +0200
Subject: [Buildroot] TestIso9660GrubExternal and TestIso9660GrubInternal
	failing
In-Reply-To: <5974e7554c7c_30a1600b705951e@ultri3.mail>
References: <20170723092643.GE2917@scaer>
 <5974e7554c7c_30a1600b705951e@ultri3.mail>
Message-ID: <20170724091321.3bc29dcc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 15:13:41 -0300, Ricardo Martincoski wrote:

> My local computer has:
> binutils 2.26.1
> qemu 2.5.0
> 
> Using my local computer the tests TestIso9660GrubExternal and
> TestIso9660GrubInternal always pass, in current master and also with the 3 grub
> patches applied.
> 
> Using the image buildroot/base I can reproduce the problems:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23825707
> GRUB requires a working absolute objcopy; upgrade your binutils
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23831270
> ==> System does not boot  

And my patches did not fix this problem ?

Best regards,

Thomas Petazoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
