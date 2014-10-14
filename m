From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:46 -0300
Subject: [Buildroot] [PATCH 09/16] libevent: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libevent/libevent.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libevent/libevent.hash

diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
new file mode 100644
index 0000000..efa0dc5
--- /dev/null
+++ b/package/libevent/libevent.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	22a530a8a5ba1cb9c080cba033206b17dacd21437762155c6d30ee6469f574f5	libevent-2.0.21-stable.tar.gz
-- 
2.0.4
