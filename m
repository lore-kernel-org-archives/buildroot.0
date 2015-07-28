From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:38 -0300
Subject: [Buildroot] [PATCH 097/113] startup-notification: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-97-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/startup-notification/startup-notification.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/startup-notification/startup-notification.hash

diff --git a/package/startup-notification/startup-notification.hash b/package/startup-notification/startup-notification.hash
new file mode 100644
index 0000000..cadbf98
--- /dev/null
+++ b/package/startup-notification/startup-notification.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c2fa09f9a49d8b319e79638e49e967c682df8726006e03059b1ffca5ab82099c	startup-notification-0.9.tar.gz
-- 
2.3.6
