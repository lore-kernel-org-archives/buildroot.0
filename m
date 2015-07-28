From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:54 -0300
Subject: [Buildroot] [PATCH 053/113] lsuio: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-53-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lsuio/lsuio.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lsuio/lsuio.hash

diff --git a/package/lsuio/lsuio.hash b/package/lsuio/lsuio.hash
new file mode 100644
index 0000000..d6077af
--- /dev/null
+++ b/package/lsuio/lsuio.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c88b3850248b2d3419e025abd7b9b0991c8bd33a2d4983f9608408a29900bfb5	lsuio-0.2.0.tar.gz
-- 
2.3.6
