From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 22:34:57 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/jasper: bump
 version to 2.0.26
Message-ID: <20210316215242.39DC67FA97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db4e04cae5bcb99b43f0821395cba0c8c4477e84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Changes:
* Fix JP2 decoder bug that can cause a null pointer dereference for
  some invalid CDEF boxes. (#268)

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5742a0f33e285e27c5ae37b32cf5570bfa856946)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index d4ed191f91..c1f1b4f602 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f5bc48e2884bcabd2aca1737baff4ca962ec665b6eb673966ced1f7adea07edb  jasper-2.0.25.tar.gz
+sha256  a82a119e85b7d1f448e61309777fa5f79053a9adca4a2b5bfe44be5439fb8fea  jasper-2.0.26.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 7b78f522db..2ff4bafb8c 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.25
+JASPER_VERSION = 2.0.26
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
