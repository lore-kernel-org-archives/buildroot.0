From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Dec 2011 10:57:20 +0100
Subject: [Buildroot] [PATCH 4/7] popt: add host variant for
	host-lttng-babeltrace
In-Reply-To: <cover.1324547779.git.thomas.petazzoni@free-electrons.com>
References: <cover.1324547779.git.thomas.petazzoni@free-electrons.com>
Message-ID: <48e5cb26efa5750b4509619cf328f02811ee81a0.1324547779.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/popt/popt.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 98f438d..fd25caa 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -16,3 +16,4 @@ POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
 endif
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.4.1
