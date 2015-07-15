From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:04 -0300
Subject: [Buildroot] [PATCH 13/40] sdl_mixer: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sdl_mixer/sdl_mixer.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sdl_mixer/sdl_mixer.hash

diff --git a/package/sdl_mixer/sdl_mixer.hash b/package/sdl_mixer/sdl_mixer.hash
new file mode 100644
index 0000000..cfe8b07
--- /dev/null
+++ b/package/sdl_mixer/sdl_mixer.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a	SDL_mixer-1.2.12.tar.gz
-- 
2.3.6
