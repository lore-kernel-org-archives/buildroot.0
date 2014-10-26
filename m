From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 17:35:14 +0100
Subject: [Buildroot] [PATCH 2/3] libevent: Remove hash file
In-Reply-To: <1414341315-31896-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414341315-31896-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414341315-31896-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the tarball we download is generated from GitHub, there's no
saying that the tarball won't differ in a month from now.
So the hash has no value there.

An update to the manual should be done

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libevent/libevent.hash | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 package/libevent/libevent.hash

diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
deleted file mode 100644
index efa0dc5..0000000
--- a/package/libevent/libevent.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256	22a530a8a5ba1cb9c080cba033206b17dacd21437762155c6d30ee6469f574f5	libevent-2.0.21-stable.tar.gz
-- 
2.1.1
