From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:00 -0300
Subject: [Buildroot] [PATCH 09/40] sdl: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sdl/sdl.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sdl/sdl.hash

diff --git a/package/sdl/sdl.hash b/package/sdl/sdl.hash
new file mode 100644
index 0000000..ad59b90
--- /dev/null
+++ b/package/sdl/sdl.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00	SDL-1.2.15.tar.gz
-- 
2.3.6
