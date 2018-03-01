From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 28 Feb 2018 23:23:37 -0600
Subject: [Buildroot] [next,v2 6/8] bash: add CPE id
In-Reply-To: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519881819-51445-7-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Thomas P
 - Updated how the ID is generated.
---
 package/bash/bash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index e938491..26da481 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -12,6 +12,7 @@ BASH_DEPENDENCIES = ncurses readline host-bison \
 BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
 BASH_LICENSE = GPL-3.0+
 BASH_LICENSE_FILES = COPYING
+BASH_CPE_ID_VENDOR = gnu
 
 BASH_CONF_ENV += \
 	ac_cv_rl_prefix="$(STAGING_DIR)" \
-- 
1.9.1
