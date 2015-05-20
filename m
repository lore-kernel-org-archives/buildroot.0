From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 20 May 2015 09:41:50 +0200
Subject: [Buildroot] [PATCH 3/3] package/luajit: fix typo in patchs commit
	log
In-Reply-To: <1432107710-3982-1-git-send-email-joerg.krause@embedded.rocks>
References: <1432107710-3982-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1432107710-3982-3-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luajit/0001-no-bin-symlink.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index 0de3162..6391f39 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -1,4 +1,4 @@
-Do not use a symlink for the binary, simply name if luajit
+Do not use a symlink for the binary, simply name it luajit
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-- 
2.4.1
