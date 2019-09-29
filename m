From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:10:09 +0200
Subject: [Buildroot] [PATCH 02/10] package/execline: bump version to 2.5.2.0
In-Reply-To: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171017.26831-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/execline/execline.hash | 2 +-
 package/execline/execline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 6bf3ccff64..7672f81471 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 f6993094766652041c21fde9c07ef53a3cd4b93a64123d9578fb4997a2cefca1  execline-2.5.0.0.tar.gz
+sha256 280bb633cbe96088193225729ad32d80493d68380a127e6bc1789aac64375e29  execline-2.5.2.0.tar.gz
 sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 83205e3706..5f482a32f9 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.5.0.0
+EXECLINE_VERSION = 2.5.2.0
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
-- 
2.21.0
