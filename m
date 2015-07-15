From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:12 -0300
Subject: [Buildroot] [PATCH 21/40] lm-sensors: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-21-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lm-sensors/lm-sensors.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lm-sensors/lm-sensors.hash

diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
new file mode 100644
index 0000000..05fd5ca
--- /dev/null
+++ b/package/lm-sensors/lm-sensors.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	5dae6a665e1150159a93743c4ff1943a7efe02cd9d3bb12c4805e7d7adcf4fcf	lm_sensors-3.3.5.tar.bz2
-- 
2.3.6
