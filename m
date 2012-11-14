From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:31:37 +0100
Subject: [Buildroot] [git commit] bash: add license info
Message-ID: <20121114214724.3DA4699FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef2d26003fbee27b7e53e49110ed3badd65c7200
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bash/bash.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 1466d26..d28c615 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -7,6 +7,9 @@
 BASH_VERSION = 4.2
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses
+BASH_LICENSE = GPLv3+
+BASH_LICENSE_FILES = COPYING
+
 BASH_CONF_ENV +=                       \
    bash_cv_job_control_missing=present \
    bash_cv_sys_named_pipes=present     \
