From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 22:38:56 +0100
Subject: [Buildroot] [git commit] package/bash-completion: bump to version
 2.10
Message-ID: <20200111213005.18AB98B375@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc9a4ac60023ad6449f43335f0e16a5c35824e26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash-completion/bash-completion.hash | 2 +-
 package/bash-completion/bash-completion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
index a286bd9bab..fa98272be6 100644
--- a/package/bash-completion/bash-completion.hash
+++ b/package/bash-completion/bash-completion.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d48fe378e731062f479c5f8802ffa9d3c40a275a19e6e0f6f6cc4b90fa12b2f5  bash-completion-2.9.tar.xz
+sha256 123c17998e34b937ce57bb1b111cd817bc369309e9a8047c0bcf06ead4a3ec92  bash-completion-2.10.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
index 2ec8d72485..4b86e9f118 100644
--- a/package/bash-completion/bash-completion.mk
+++ b/package/bash-completion/bash-completion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_COMPLETION_VERSION = 2.9
+BASH_COMPLETION_VERSION = 2.10
 BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
 BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
 BASH_COMPLETION_LICENSE = GPL-2.0
