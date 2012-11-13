From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:37 +0100
Subject: [Buildroot] [PATCH 03/30] bash: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bash/bash.mk |    3 +++
 1 file changed, 3 insertions(+)

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
-- 
1.7.10.4
