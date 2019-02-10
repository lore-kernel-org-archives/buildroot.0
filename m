From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 14:18:59 +0100
Subject: [Buildroot] [git commit branch/next] package/brcm-patchram-plus:
 fix license file hash
Message-ID: <20190213214530.3B4278A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35dde6de1fc23bcc5a56eed30cac46d201b7104a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 684bcc45e52a8300a2115799e96017b180695a14
("package/brcm-patchram-plus: fix build on sparc") added a patch that
modifies the src/main.c file, without paying attention to the fact
that this file is used as the license file for the package, and
therefore the .hash had to be updated at the same time. This commit
updates the license file hash as needed. There are obviously no
licensing related changes in the SPARC build fixes.

Fixes:

  http://autobuild.buildroot.net/results/083ce1c3100b10e40480e6330ce0c29dde51f5e0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/brcm-patchram-plus/brcm-patchram-plus.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.hash b/package/brcm-patchram-plus/brcm-patchram-plus.hash
index fb7a91f114..0da680cd85 100644
--- a/package/brcm-patchram-plus/brcm-patchram-plus.hash
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
@@ -1,3 +1,3 @@
 # locally computed
 sha256  7d63f3a0c79cb5d187a0f2647734601f9c97d4eb8e545ce9ace7653c1f3f9a58  brcm-patchram-plus-94fb127e614b19a9a95561b8c1a0716e2e1e6293.tar.gz
-sha256  3bbeac0dc9f456695e692687c9d90a3c4ffc0253b0476d487d8cede207a8dc5b  src/main.c
+sha256  2ba6b830c7d2186f6d5e4470ce5ffe73d97faf69b0d967f2455b725809dfca7b  src/main.c
