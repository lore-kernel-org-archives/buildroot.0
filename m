From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 09:09:10 +0100
Subject: [Buildroot] [git commit] manual/configure.txt: reword part about
	internal toolchain backend
Message-ID: <20140329092228.C43679C415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=541d070c013259bd83dd47b67d1535d762413e70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/configure.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index badb6e4..16c86cc 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -100,7 +100,7 @@ most important ones allow to:
    toolchain should have largefile support (i.e support for files
    larger than 2 GB on 32 bits systems), IPv6 support, RPC support
    (used mainly for NFS), wide-char support, locale support (for
-   internationalization), C++ support, thread support. Depending on
+   internationalization), C++ support or thread support. Depending on
    which options you choose, the number of userspace applications and
    libraries visible in Buildroot menus will change: many applications
    and libraries require certain toolchain options to be enabled. Most
