From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:07 -0300
Subject: [Buildroot] [PATCH 066/113] nut: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-66-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nut/nut.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/nut/nut.hash

diff --git a/package/nut/nut.hash b/package/nut/nut.hash
new file mode 100644
index 0000000..0174366
--- /dev/null
+++ b/package/nut/nut.hash
@@ -0,0 +1,2 @@
+# From http://www.networkupstools.org/source/2.7/nut-2.7.2.tar.gz.sha256
+sha256	4d5365359b059d96dfcb77458f361a114d26c84f1297ffcd0c6c166f7200376d	nut-2.7.2.tar.gz
-- 
2.3.6
