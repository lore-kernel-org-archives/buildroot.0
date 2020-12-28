From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:33:32 +0100
Subject: [Buildroot] [git commit] package/pcre2: remove empty line from
 Config.in
Message-ID: <20201228211741.7684D80235@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd92203147f5695423e8b82044f7b915c3b1e423
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre2/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pcre2/Config.in b/package/pcre2/Config.in
index f35877f376..f06f1914f3 100644
--- a/package/pcre2/Config.in
+++ b/package/pcre2/Config.in
@@ -1,4 +1,3 @@
-
 config BR2_PACKAGE_PCRE2
 	bool "pcre2"
 	help
