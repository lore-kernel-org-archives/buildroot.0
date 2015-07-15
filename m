From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:03 -0300
Subject: [Buildroot] [PATCH 12/40] sdl_net: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sdl_net/sdl_net.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sdl_net/sdl_net.hash

diff --git a/package/sdl_net/sdl_net.hash b/package/sdl_net/sdl_net.hash
new file mode 100644
index 0000000..56a7484
--- /dev/null
+++ b/package/sdl_net/sdl_net.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4	SDL_net-1.2.8.tar.gz
-- 
2.3.6
