From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 20 Apr 2015 05:25:43 +0200
Subject: [Buildroot] [PATCH 1/3] package/pkgconf: add hash
Message-ID: <1429500345-31730-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkgconf/pkgconf.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/pkgconf/pkgconf.hash

diff --git a/package/pkgconf/pkgconf.hash b/package/pkgconf/pkgconf.hash
new file mode 100644
index 0000000..97060bd
--- /dev/null
+++ b/package/pkgconf/pkgconf.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 3bbb1c40832b522de0bf0e5bdeba62160ac499a541facedac5755929a9e87027 pkgconf-0.8.9.tar.bz2
-- 
2.3.5
