From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:55:32 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] DEVELOPERS: add Gwenhael
 Goavec-Merou for librtlsdr
Message-ID: <20200828155254.84B2E83DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=777d730a00b7bcb57d4fe3359ab0d9de2b71cc7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Even though librtlsdr was initially introduced by Jason Pruitt in
2014, and Jason is still listed in the DEVELOPERS file for this
package, in recent times it's mainly Gwenhael who has been taking of
this package. Let's reflect that in the DEVELOPERS file so that
Gwenhael gets notified when there are librtlsdr issues.

Cc: Jason Pruitt <jrspruitt@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 72df067afedff0318e61523c982f0c39df94adde)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3bc9f4dd4c..64d2e2e609 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1042,6 +1042,7 @@ N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 F:	package/gnuradio/
 F:	package/gqrx/
 F:	package/gr-osmosdr/
+F:	package/librtlsdr/
 F:	package/libusbgx/
 F:	package/python-cheetah/
 F:	package/python-markdown/
