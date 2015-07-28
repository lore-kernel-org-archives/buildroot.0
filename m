From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:21 -0300
Subject: [Buildroot] [PATCH 080/113] pulseaudio: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-80-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pulseaudio/pulseaudio.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/pulseaudio/pulseaudio.hash

diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
new file mode 100644
index 0000000..dad495e
--- /dev/null
+++ b/package/pulseaudio/pulseaudio.hash
@@ -0,0 +1,3 @@
+# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-5.0.tar.xz.{md5,sha1}
+md5	c43749838612f4860465e83ed62ca38e	pulseaudio-5.0.tar.xz
+sha1	e420931a0b9cf37331cd06e30ba415046317ab85	pulseaudio-5.0.tar.xz
-- 
2.3.6
