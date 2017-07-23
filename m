From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 23 Jul 2017 02:26:53 +0200
Subject: [Buildroot] [git commit] package/kvm-unit-tests: fix syntax
Message-ID: <20170723002744.1121B80842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dae8c70a8db47d8cb24f1bca22e12fde33ce892b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kvm-unit-tests/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 8b172c3..d0d9e2e 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 	bool
 	# On ARM, it uses virtualization extensions
 	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
-		BR2_cortex_a15 || BR2_cortex_a15_a7 \
+		BR2_cortex_a15 || BR2_cortex_a15_a7 || \
 		BR2_cortex_a17 || BR2_cortex_a17_a7
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le
