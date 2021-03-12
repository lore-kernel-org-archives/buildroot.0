From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 12 Mar 2021 14:05:31 -0600
Subject: [Buildroot] [PATCH 5/8] package/grep: add host package
In-Reply-To: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20210312200534.923-6-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/grep/grep.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 27d204d4ce..332f9509ee 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -46,3 +46,4 @@ GREP_CONF_OPTS += --disable-perl-regexp
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.1
