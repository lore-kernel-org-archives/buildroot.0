From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Feb 2011 23:09:54 +0100
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
In-Reply-To: <AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
References: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F5E11D6@EXV1.corp.adtran.com>
	<AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
Message-ID: <20110221230954.4b39da54@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Feb 2011 13:30:01 -0800
Charles Krinke <charles.krinke@gmail.com> wrote:

> bootcmd=bootm 0xfe120000 - 0xfe080000
> bootargs=root=/dev/mtdblock2 rootfstype=jffs2
> mtdparts=nor:1152k(U-Boot),2176k(kernel),-(JFFS2) rw console=ttyS0,115200
> 
> As I recall, this was working the last time I did it 5 years ago, but again,
> I probably have forgotten a few details or there are some config options not
> yet turned on. I am working with buildroot defaults so far.

Your kernel configuration looks ok. Please give some details:

 *) How do you flash your JFFS2 filesystem (exact commands)

 *) The full kernel boot log

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
