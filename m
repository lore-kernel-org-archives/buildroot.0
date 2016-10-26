From: Cyril Bur <cyrilbur@gmail.com>
Date: Wed, 26 Oct 2016 14:19:16 +1100
Subject: [Buildroot] [PATCH v2 2/2] kvm-unit-tests: Bump version
In-Reply-To: <20161026031916.17158-1-cyrilbur@gmail.com>
References: <20161026031916.17158-1-cyrilbur@gmail.com>
Message-ID: <20161026031916.17158-2-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump includes several fixes for x86 and a significant fix
to powerpc transactional memory tests.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 97c8eb8..5028e38 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 0b04ed0610035792514fd8499eb4dacc185520d9
+KVM_UNIT_TESTS_VERSION = 5731572b2ac23eb410732110b93425b5bb7f27dd
 KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-tests.git
 KVM_UNIT_TESTS_SITE_METHOD = git
 KVM_UNIT_TESTS_LICENSE = LGPLv2
-- 
2.10.1
