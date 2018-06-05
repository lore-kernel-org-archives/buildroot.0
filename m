From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 22:16:34 +0200
Subject: [Buildroot] [PATCH] libbsd: bump to version 0.9.1
In-Reply-To: <f54e614d6b4a1de2ab39e843ed6266828faecd15.1528222775.git.baruch@tkos.co.il>
References: <f54e614d6b4a1de2ab39e843ed6266828faecd15.1528222775.git.baruch@tkos.co.il>
Message-ID: <20180605221634.3a53fa0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 21:19:35 +0300, Baruch Siach wrote:
> Drop upstream patches.
> 
> Add a patch fixing build with musl libc.
> 
> Update the list of licenses based on the content of COPYING. The
> BSD-5-Clause license is not listed by SPDX, but that is its name in the
> COPYING file.

The license seems to really be

BSD-5-clause-Peter-Wemm

because the license text itself refers to Peter Wemm.

Yocto is really using a longer list of licenses:
https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/libbsd/libbsd_0.8.7.bb

For now I've applied your patch, because it's definitely not worse
than what we have, but perhaps we want to make it even better.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
