From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Feb 2011 22:40:29 +0100
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
In-Reply-To: <AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
References: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F5E11D6@EXV1.corp.adtran.com>
	<AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
Message-ID: <20110221224029.07260bea@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Feb 2011 13:30:01 -0800
Charles Krinke <charles.krinke@gmail.com> wrote:

> When I boot a jffs2 image created with buildroot with its associated kernel,
> I get a kernel panic when trying to mount the jffs2 image that looks like
> this:
> 
> VFS: Cannot open root device "mtdblock2" or unknown-block(2,0)
> Please append a correct "root=" boot option; here are the available
> partitions:
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(2,0)

Could you post your kernel .config ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
