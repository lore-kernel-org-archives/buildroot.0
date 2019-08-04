From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:41:54 +0200
Subject: [Buildroot] [PATCH 11/18] package/haserl: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/haserl/haserl.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/haserl/haserl.hash b/package/haserl/haserl.hash
index 2b23a6c6ee..149bf0b0a5 100644
--- a/package/haserl/haserl.hash
+++ b/package/haserl/haserl.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/haserl/files/haserl-devel/
 md5	918f0b4f6cec0b438c8b5c78f2989010	haserl-0.9.35.tar.gz
 sha1	9a331d41e9d47a81e81e158f9a16bf5443347cd4	haserl-0.9.35.tar.gz
+# Locally computed
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
-- 
2.20.1
