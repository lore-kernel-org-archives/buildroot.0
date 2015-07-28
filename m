From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:57 -0300
Subject: [Buildroot] [PATCH 056/113] mediastreamer: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-56-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mediastreamer/mediastreamer.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mediastreamer/mediastreamer.hash

diff --git a/package/mediastreamer/mediastreamer.hash b/package/mediastreamer/mediastreamer.hash
new file mode 100644
index 0000000..44849ac
--- /dev/null
+++ b/package/mediastreamer/mediastreamer.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	c245b9444c2abb4c84433606e01f0b3ce29ce78de0afe1e191f4f3c62656acd5	mediastreamer-2.9.0.tar.gz
-- 
2.3.6
