From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 11:29:13 -0300
Subject: [Buildroot] [PATCH 4/6] kbd: add hash file
In-Reply-To: <1426688955-23233-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426688955-23233-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426688955-23233-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/kbd/kbd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/kbd/kbd.hash

diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
new file mode 100644
index 0000000..c4dfd23
--- /dev/null
+++ b/package/kbd/kbd.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
+sha256	400196f5f51f1900ad2df2c02b61945a72e5ccadd7fb7e1f72b3d89bd33debef	kbd-1.15.5.tar.xz
-- 
2.0.5
