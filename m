From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:35:41 +0200
Subject: [Buildroot] [git commit] libevent: add hash file
Message-ID: <20141019153637.8D418AF9BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=306073909d440ea930d8b538a2d3c1f1473df3a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevent/libevent.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
new file mode 100644
index 0000000..efa0dc5
--- /dev/null
+++ b/package/libevent/libevent.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	22a530a8a5ba1cb9c080cba033206b17dacd21437762155c6d30ee6469f574f5	libevent-2.0.21-stable.tar.gz
