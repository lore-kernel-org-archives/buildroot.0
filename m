From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 11:59:07 +0200
Subject: [Buildroot] [PATCH] Build El Torito for i386 PC
In-Reply-To: <1438159289.2675.5.camel@intel.com>
References: <1438159289.2675.5.camel@intel.com>
Message-ID: <20150729115907.01a2f538@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ray,

Thanks for this patch!

On Wed, 29 Jul 2015 08:41:29 +0000, Kinsella, Ray wrote:
> Building Grub2 El Torito for i386 EFI errors complaining it cannot find cdboot.img
> 
>         cdboot.img: No such file or directory
> 
> This commit builds El Torito for i386 EFI only

It looks good, but the commit log lacks your Signed-off-by. See
http://buildroot.org/downloads/manual/manual.html#submitting-patches
for some details, and http://elinux.org/Developer_Certificate_Of_Origin.

Can you resubmit with your SoB line added?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
