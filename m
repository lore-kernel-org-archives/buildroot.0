From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 17:52:36 +0200
Subject: [Buildroot] [git commit] vim: bump version to v8.0.0001
Message-ID: <20160912155735.EB9C780649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec63228bd53ffb21704dc7ec9a2dcee64506504f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index bb2d013..bc4a08e 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7c90f16e1d1547a864f4419cd7d066ca4ce822de285b2a718f9274e5241fe2fd vim-v7.4.1902.tar.gz
+sha256 9b4790dafc886537096a6e1953ee0424b8c308881b97151a7bfba1f9fd14e3f9  vim-v8.0.0001.tar.gz
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index c2f6cac..d55e905 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = v7.4.1902
+VIM_VERSION = v8.0.0001
 VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
 # Win over busybox vi since vim is more feature-rich
 VIM_DEPENDENCIES = \
