From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:20 -0300
Subject: [Buildroot] [PATCH 29/40] libdvdnav: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-29-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libdvdnav/libdvdnav.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libdvdnav/libdvdnav.hash

diff --git a/package/libdvdnav/libdvdnav.hash b/package/libdvdnav/libdvdnav.hash
new file mode 100644
index 0000000..4a0d851
--- /dev/null
+++ b/package/libdvdnav/libdvdnav.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	7fca272ecc3241b6de41bbbf7ac9a303ba25cb9e0c82aa23901d3104887f2372	libdvdnav-4.2.1.tar.xz
-- 
2.3.6
