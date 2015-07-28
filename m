From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:13 +0200
Subject: [Buildroot] [git commit] tinc: add hash file
Message-ID: <20150728204054.39EB37F9DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d0c8a65377ff748c5419e76147f0b76ebb716f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinc/tinc.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
new file mode 100644
index 0000000..721b6bd
--- /dev/null
+++ b/package/tinc/tinc.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	498e58f9f39e3922030a63cf62baf4b46a40fbda8d90b23ec0f084f4a9f9b687	tinc-1.0.24.tar.gz
