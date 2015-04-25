From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:50:41 +0200
Subject: [Buildroot] [git commit] package/uclibc: add missing hash for
	eXtensa
Message-ID: <20150425095654.F3D1080094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aacae5f1e18a7d30bfb94f374cebc654bafd6720
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a git snapshot, we can't have a hash for it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 7bfe46f..729c643 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -6,3 +6,6 @@ sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-a
 
 # From http://www.uclibc-ng.org/trac/
 sha256  7e92e99995daa634cbdc63c297784df6e8fe39cc1d3bbd2d37eb5c3ced8a86e5        uClibc-ng-1.0.2.tar.xz
+
+# No hash for this git snapshot
+none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
