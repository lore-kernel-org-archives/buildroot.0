From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:01 -0300
Subject: [Buildroot] [PATCH 10/40] sdl_ttf: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sdl_ttf/sdl_ttf.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sdl_ttf/sdl_ttf.hash

diff --git a/package/sdl_ttf/sdl_ttf.hash b/package/sdl_ttf/sdl_ttf.hash
new file mode 100644
index 0000000..ac7d6a6
--- /dev/null
+++ b/package/sdl_ttf/sdl_ttf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7	SDL_ttf-2.0.11.tar.gz
-- 
2.3.6
