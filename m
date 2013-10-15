From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Oct 2013 15:13:28 +0200
Subject: [Buildroot] [git commit] ngrep: add license information
Message-ID: <20131015131536.52C689B2A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f87f067c027261eb8c0ac8ad120fe845570aaae3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use BSD-4c-like for license]
Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngrep/ngrep.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 99b8f46..6a9b42f 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -7,6 +7,8 @@
 NGREP_VERSION = 1.45
 NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
 NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
+NGREP_LICENSE = BSD-4c-like
+NGREP_LICENSE_FILES = LICENSE.txt
 NGREP_INSTALL_STAGING = YES
 NGREP_CONF_ENV = LDFLAGS="-lpcre"
 NGREP_CONF_OPT =  \
