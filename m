From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:18 -0300
Subject: [Buildroot] [PATCH 27/40] libcuefile: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-27-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcuefile/libcuefile.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcuefile/libcuefile.hash b/package/libcuefile/libcuefile.hash
index 0f500cb..57db91f 100644
--- a/package/libcuefile/libcuefile.hash
+++ b/package/libcuefile/libcuefile.hash
@@ -1,2 +1,4 @@
 # From https://www.musepack.net/index.php?pg=src
 md5	1a6ac52e1080fd54f0f59372345f1e4e	libcuefile_r475.tar.gz
+# Calculated based on the hash above
+sha256	b681ca6772b3f64010d24de57361faecf426ee6182f5969fcf29b3f649133fe7	libcuefile_r475.tar.gz
-- 
2.3.6
