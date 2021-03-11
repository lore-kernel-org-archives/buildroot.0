From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 11 Mar 2021 21:49:21 +0100
Subject: [Buildroot] [PATCH v1] package/bash-completion: bump version to 2.11
Message-ID: <20210311204921.2438-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bash-completion/bash-completion.hash | 4 ++--
 package/bash-completion/bash-completion.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
index fa98272be6..7e952e5b02 100644
--- a/package/bash-completion/bash-completion.hash
+++ b/package/bash-completion/bash-completion.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 123c17998e34b937ce57bb1b111cd817bc369309e9a8047c0bcf06ead4a3ec92  bash-completion-2.10.tar.xz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac  bash-completion-2.11.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
index 4b86e9f118..8b0e949416 100644
--- a/package/bash-completion/bash-completion.mk
+++ b/package/bash-completion/bash-completion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_COMPLETION_VERSION = 2.10
+BASH_COMPLETION_VERSION = 2.11
 BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
 BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
 BASH_COMPLETION_LICENSE = GPL-2.0
-- 
2.30.1
