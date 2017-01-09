From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 17:18:29 +0100
Subject: [Buildroot] [git commit] nano: bump version to 2.7.3
Message-ID: <20170109163505.6AC8981770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ee028791bc16ff04f48236ce5917c1c53921874
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index d1814ae..94fd990 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 77016f73c686857ce8a3ec217832febb6e636122762d47ce3c6cbef6f7e390c2  nano-2.7.2.tar.xz
+sha256 d926ef5060d23bafec75dab9328bb9b9df9a08e58c56b9061d686f5698770bfc  nano-2.7.3.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 7f80554..da92268 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.7
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION = $(NANO_VERSION_MAJOR).3
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPLv3+
