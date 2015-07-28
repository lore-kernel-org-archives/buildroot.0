From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:20 -0300
Subject: [Buildroot] [PATCH 079/113] portaudio: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-79-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/portaudio/portaudio.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/portaudio/portaudio.hash

diff --git a/package/portaudio/portaudio.hash b/package/portaudio/portaudio.hash
new file mode 100644
index 0000000..b83e9d9
--- /dev/null
+++ b/package/portaudio/portaudio.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9c26d1330d506496789edafe55b0386f20d83c4aa2c0e3f81fbeb0f114ab1b99	pa_stable_v19_20111121.tgz
-- 
2.3.6
