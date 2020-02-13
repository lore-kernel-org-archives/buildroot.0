From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 13 Feb 2020 23:29:13 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add me for toolchain topic
Message-ID: <20200213222913.538012-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first time I worked on the Buildroot's toolchain infra
was to add support for the Sourcery Codebench Standard
(licenced) edition toolchain (from Mentor Graphics) for
x86 target [1]. The series was rejected though.

But the knowledge gained from this work served to refactor
the toolchain-external infra in Buildroot [2].

Nowadays, I'm using toolchains-builder project to do
some toolchain build testing to keep GNU tools up to date
in Buildroot.

[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112036.html
[2] http://lists.busybox.net/pipermail/buildroot/2016-October/175433.html
[3] https://gitlab.com/kubu93/toolchains-builder/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f67a85d55..e4a3bcb24a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2163,9 +2163,7 @@ F:	package/waffle/
 F:	package/xenomai/
 F:	package/zziplib/
 F:	support/testing/tests/package/test_glxinfo.py
-F:	toolchain/toolchain-external/toolchain-external-arm-aarch64/
-F:	toolchain/toolchain-external/toolchain-external-arm-aarch64-be/
-F:	toolchain/toolchain-external/toolchain-external-arm-arm/
+F:	toolchain/
 
 N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
 F:	package/davfs2/
-- 
2.24.1
