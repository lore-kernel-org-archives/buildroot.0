From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 23:42:48 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Gwenhael Goavec-Merou for
 librtlsdr
Message-ID: <20200811214248.514502-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though librtlsdr was initially introduced by Jason Pruitt in
2014, and Jason is still listed in the DEVELOPERS file for this
package, in recent times it's mainly Gwenhael who has been taking of
this package. Let's reflect that in the DEVELOPERS file so that
Gwenhael gets notified when there are librtlsdr issues.

Cc: Jason Pruitt <jrspruitt@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.26.2
