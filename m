From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:24:45 +0200
Subject: [Buildroot] [git commit branch/next] package/fontconfig: add hash
 for license file
Message-ID: <20190530223346.87B2E8E72C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b939e8647ce91865a3b5ada2b1bef2358c50274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fontconfig/fontconfig.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index 5243c09615..153f00c3d8 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,2 +1,5 @@
 # From https://lists.freedesktop.org/archives/fontconfig/2018-August/006324.html
 sha256 f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741 fontconfig-2.13.1.tar.bz2
+
+# Locally calculated
+sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886 COPYING
