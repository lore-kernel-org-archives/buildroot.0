From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:28:34 +0200
Subject: [Buildroot] [PATCH 0/10] wayland: bump and new backend (branch
 yem/bumps)
In-Reply-To: <cover.1411232859.git.yann.morin.1998@free.fr>
References: <cover.1411232859.git.yann.morin.1998@free.fr>
Message-ID: <20140921212834.0137f281@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Sep 2014 19:09:52 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (10):
>       package/libinput: bump version
>       package/freerdp: bump version

Those two patches applied.

>       package/freerdp: do not forcibly depend on X.Org
>       pacakge/freerdp: disable building the manpages
>       package/freerdp: add options to enable/disable server and/or client
>       package/freerdp: also install to staging
>       package/freerdp: install server key and certificate

I'll wait a bit more on those ones, need a bit more time to review/test.

>       package/wayland: bump to 1.6.0
>       package/weston: bump to 1.6.0

Both applied.

>       package/weston: add support for the RDP compositor

Needs the previous non-applied patches, so not applied for now.

Romain, you had some comments on the first patch (regarding libinput).
Once you've done some more testing, do not hesitate to submit
additional patches if needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
