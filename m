From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:05 -0300
Subject: [Buildroot] [PATCH 14/40] sdl_image: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sdl_image/sdl_image.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sdl_image/sdl_image.hash

diff --git a/package/sdl_image/sdl_image.hash b/package/sdl_image/sdl_image.hash
new file mode 100644
index 0000000..8362234
--- /dev/null
+++ b/package/sdl_image/sdl_image.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699	SDL_image-1.2.12.tar.gz
-- 
2.3.6
