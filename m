From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:07 -0300
Subject: [Buildroot] [PATCH 16/40] sawman: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sawman/sawman.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sawman/sawman.hash

diff --git a/package/sawman/sawman.hash b/package/sawman/sawman.hash
new file mode 100644
index 0000000..6fd2ecd
--- /dev/null
+++ b/package/sawman/sawman.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	2cfb0a5d5114e6d0eb777b881ede2614d047786b90c505897c9e5d45288e0d4c	SaWMan-1.6.3.tar.gz
-- 
2.3.6
