From: Alexander Dahl <post@lespocky.de>
Date: Fri, 8 Dec 2017 08:06:52 +0100
Subject: [Buildroot] [PATCH] fastd: fix build with newer libsodium
In-Reply-To: <c807b9a816f86998b946f7508e1adbcc42aaa3b1.1512668886.git.baruch@tkos.co.il>
References: <c807b9a816f86998b946f7508e1adbcc42aaa3b1.1512668886.git.baruch@tkos.co.il>
Message-ID: <20171208070652.zgnl7xptchvlx5oa@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Thu, Dec 07, 2017 at 07:48:06PM +0200, Baruch Siach wrote:
> Add upstream patch removing aes128-ctr support that libsodium no longer
> provides.

You didn't notice there are already two patches for fastd, now there
are:

* 0001-cipher-remove-aes128-ctr-NaCl-implementation.patch
* 0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch
* 0002-CMakeList-do-not-overwrite-module-path.patch

The new patch should be 0003.

Greets
Alex

-- 
?With the first link, the chain is forged. The first speech censured, 
the first thought forbidden, the first freedom denied, chains us all 
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171208/ca54b8d8/attachment.asc>
