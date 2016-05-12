From: Alexander Dahl <post@lespocky.de>
Date: Thu, 12 May 2016 08:36:43 +0200
Subject: [Buildroot] [PATCH 1/1] rrdtool: bump version to 1.6.0
In-Reply-To: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de>
References: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de>
Message-ID: <c690b224c72393951464111db672db64@idefix.lespocky.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 2016-05-09 22:10, schrieb Roland Franke:
> delete patch 0001-Add-configure-option-to-disable-documentation.patch
> as this is now include in the new version.
> 
> Signed-off-by: Roland Franke <fli4l@franke-prem.de>

Reviewed-by: Alexander Dahl <post@lespocky.de>

I checked the removed patch has gone upstream (it has, see [1]) and
successfully built it with beaglebone_defconfig. 

If the removed autoreconf and gettextize options break the build, we can
just use the v1 of the patch, can't we?

Greets
Alex

[1] https://github.com/oetiker/rrdtool-1.x/pull/690

-- 
?With the first link, the chain is forged. The first speech censured,
the first thought forbidden, the first freedom denied, chains us all
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***
