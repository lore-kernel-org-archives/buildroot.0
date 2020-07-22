From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jul 2020 16:53:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/gettext-tiny.hash: remove hash
 value for gettext-gnu
Message-ID: <20200722145417.2195-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gettext-tiny hash file holds a value that belongs to the gettext-gnu.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/gettext-tiny/gettext-tiny.hash | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index 201b05c6ff..585a2bdcc3 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -2,5 +2,3 @@
 sha256 efc740007c82a9b3a0d382fb50d212fa7dc0beddb9695409ee79684f9f2124b2  gettext-tiny-adaa9c64921e80f2b8dd3610ffb508618b9204f3.tar.gz
 sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
 sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
-# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
-sha1 62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90 gettext-0.20.1.tar.xz
-- 
2.20.1
