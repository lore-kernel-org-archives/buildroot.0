From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Aug 2020 23:50:15 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add Gwenhael Goavec-Merou for
 librtlsdr
Message-ID: <20200811214414.2F34F82646@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72df067afedff0318e61523c982f0c39df94adde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though librtlsdr was initially introduced by Jason Pruitt in
2014, and Jason is still listed in the DEVELOPERS file for this
package, in recent times it's mainly Gwenhael who has been taking of
this package. Let's reflect that in the DEVELOPERS file so that
Gwenhael gets notified when there are librtlsdr issues.

Cc: Jason Pruitt <jrspruitt@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ee840dbb8b..42fa5a4956 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1087,6 +1087,7 @@ N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 F:	package/gnuradio/
 F:	package/gqrx/
 F:	package/gr-osmosdr/
+F:	package/librtlsdr/
 F:	package/libusbgx/
 F:	package/matio/
 F:	package/python-cheetah/
