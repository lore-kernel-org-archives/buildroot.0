From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 26 Jun 2017 15:21:44 +0200
Subject: [Buildroot] [PATCH 3/4] sigrok-cli: bump version to 0.7.0
In-Reply-To: <1498483305-17826-1-git-send-email-brgl@bgdev.pl>
References: <1498483305-17826-1-git-send-email-brgl@bgdev.pl>
Message-ID: <1498483305-17826-4-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 package/sigrok-cli/sigrok-cli.hash | 2 +-
 package/sigrok-cli/sigrok-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sigrok-cli/sigrok-cli.hash b/package/sigrok-cli/sigrok-cli.hash
index b60b57e..42bbdc1 100644
--- a/package/sigrok-cli/sigrok-cli.hash
+++ b/package/sigrok-cli/sigrok-cli.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	ab2ede4e245f3987e19a89a530bd204e0d792c07474d9fed3345d4af4e84723c	sigrok-cli-0.6.0.tar.gz
+sha256	5669d968c2de3dfc6adfda76e83789b6ba76368407c832438cef5e7099a65e1c	sigrok-cli-0.7.0.tar.gz
diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 3e2d1bf..1e017d6 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGROK_CLI_VERSION = 0.6.0
+SIGROK_CLI_VERSION = 0.7.0
 SIGROK_CLI_SITE = http://sigrok.org/download/source/sigrok-cli
 SIGROK_CLI_LICENSE = GPL-3.0+
 SIGROK_CLI_LICENSE_FILES = COPYING
-- 
2.9.3
