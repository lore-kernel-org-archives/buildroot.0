From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:05 -0300
Subject: [Buildroot] [PATCH 004/113] eeprog: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/eeprog/eeprog.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/eeprog/eeprog.hash

diff --git a/package/eeprog/eeprog.hash b/package/eeprog/eeprog.hash
new file mode 100644
index 0000000..c91be72
--- /dev/null
+++ b/package/eeprog/eeprog.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	35155cc3844d2c3ae8ed6935fda72768c7f24fddc4a0fca89e4ffbb34880d9ef	eeprog-0.7.6.tar.gz
-- 
2.3.6
