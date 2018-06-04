From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 21:58:44 +0200
Subject: [Buildroot] [PATCH 1/1] libserial: bump to version 0.6rc3
In-Reply-To: <20180603192907.7490-1-fontaine.fabrice@gmail.com>
References: <20180603192907.7490-1-fontaine.fabrice@gmail.com>
Message-ID: <20180604215844.38da01bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jun 2018 21:29:07 +0200, Fabrice Fontaine wrote:
> - Move site to github
> - Remove first patch and use --without-python instead
> - Remove second patch (patch has been merged in 2015:
>   https://github.com/crayzeewulf/libserial/commit/47ca0621ccd2100e4ba0d7f4e2a861d14f05f63c)
> - Add new patch to disable tests
> - Update license to LGPL-2.0+ and add COPYING.LESSER and LICENSE.txt:
>   https://github.com/crayzeewulf/libserial/commit/6f716c4d79bb31a0c21f3ee9680111c633ac4840

There's an issue with this: the COPYING.LESSER license text contains
the text of LGPL-3.0, not LGPL-2.0, which is a bit weird.

Could you check with upstream if they could fix this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
