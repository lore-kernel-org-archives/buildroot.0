From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:55:36 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] DEVELOPERS: add Gwenhael
 Goavec-Merou for librtlsdr
Message-ID: <20200828155322.2AE2286539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ece6d79e72dcfaffe717e361e9d8cb79ea9143d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

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
index 5d58fb2994..539a07511a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1076,6 +1076,7 @@ N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 F:	package/gnuradio/
 F:	package/gqrx/
 F:	package/gr-osmosdr/
+F:	package/librtlsdr/
 F:	package/libusbgx/
 F:	package/matio/
 F:	package/python-cheetah/
