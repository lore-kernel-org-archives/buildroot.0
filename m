From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:27:59 -0300
Subject: [Buildroot] [PATCH 08/40] shared-mime-info: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/shared-mime-info/shared-mime-info.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/shared-mime-info/shared-mime-info.hash

diff --git a/package/shared-mime-info/shared-mime-info.hash b/package/shared-mime-info/shared-mime-info.hash
new file mode 100644
index 0000000..cd237dd
--- /dev/null
+++ b/package/shared-mime-info/shared-mime-info.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	52c9f84a8c72de631a0458542980b1728560f59845eb5e93e1dbe825f4b72304	shared-mime-info-0.90.tar.bz2
-- 
2.3.6
