From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:44 -0000
Subject: [Buildroot] [git commit branch/next] olsr: update hash source
	comment
Message-ID: <20150808105632.90C61818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8e1c0ca47fd0b23964580389ffb9a063b9a851a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit ec9e34c9bb7c (olsr: bump version, 2015-07-14) update the hash but left
the old source comment. Fix this.

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/olsr.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/olsr/olsr.hash b/package/olsr/olsr.hash
index 83c48e0..e14d52c 100644
--- a/package/olsr/olsr.hash
+++ b/package/olsr/olsr.hash
@@ -1,2 +1,2 @@
-# From http://www.olsr.org/releases/0.6/SHA256SUM-0.6.8
+# From http://www.olsr.org/releases/0.9/SHA256SUM-0.9.0.2
 sha256	cc464b29c7740354d815d5faa753fd27c0677d71e8eb42e78abc382996892845 olsrd-0.9.0.2.tar.bz2
