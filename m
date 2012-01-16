From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 16 Jan 2012 14:58:43 +0100
Subject: [Buildroot] [PATCH resend 09/22] mpfr: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1326722336-11759-1-git-send-email-arnout@mind.be>
References: <1326722336-11759-1-git-send-email-arnout@mind.be>
Message-ID: <1326722336-11759-10-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpfr/mpfr.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 7f33599..6876d6f 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -10,7 +10,6 @@ MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
-HOST_MPFR_DEPENDENCIES = host-gmp
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.8.3
