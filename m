From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:26 -0300
Subject: [Buildroot] [PATCH 025/113] libbsd: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-25-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libbsd/libbsd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libbsd/libbsd.hash

diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
new file mode 100644
index 0000000..be4ba50
--- /dev/null
+++ b/package/libbsd/libbsd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	9e8f34ffa9c8579c87965a55a82d8ac37a1dc64858f717b7c49452ade277cc62	libbsd-0.6.0.tar.xz
-- 
2.3.6
