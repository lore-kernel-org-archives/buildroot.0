From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:31 -0300
Subject: [Buildroot] [PATCH 090/113] read-edid: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-90-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/read-edid/read-edid.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/read-edid/read-edid.hash

diff --git a/package/read-edid/read-edid.hash b/package/read-edid/read-edid.hash
new file mode 100644
index 0000000..2c5501c
--- /dev/null
+++ b/package/read-edid/read-edid.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c1b5d839fe6349efc183b3a3d33a8be1cd0dfea3c94015a86159d8aaeb6e9dd7	read-edid-1.4.2.tar.gz
-- 
2.3.6
