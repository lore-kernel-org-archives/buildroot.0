From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:02 -0300
Subject: [Buildroot] [PATCH 11/40] sdl_sound: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sdl_sound/sdl_sound.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sdl_sound/sdl_sound.hash

diff --git a/package/sdl_sound/sdl_sound.hash b/package/sdl_sound/sdl_sound.hash
new file mode 100644
index 0000000..a548627
--- /dev/null
+++ b/package/sdl_sound/sdl_sound.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	3999fd0bbb485289a52be14b2f68b571cb84e380cc43387eadf778f64c79e6df	SDL_sound-1.0.3.tar.gz
-- 
2.3.6
