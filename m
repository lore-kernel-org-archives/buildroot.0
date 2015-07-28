From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:28 -0300
Subject: [Buildroot] [PATCH 027/113] libev: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-27-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libev/libev.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libev/libev.hash

diff --git a/package/libev/libev.hash b/package/libev/libev.hash
new file mode 100644
index 0000000..2252483
--- /dev/null
+++ b/package/libev/libev.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	88fc5f89ca96ceca14c16c10e7be3e921dae65e84932d680c2fd6a40173edccb	libev-4.19.tar.gz
-- 
2.3.6
