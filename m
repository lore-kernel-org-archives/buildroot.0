From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 8 Feb 2015 15:07:06 +0000
Subject: [Buildroot] [PATCH 2/3] glibc: set version 2.20 as default
In-Reply-To: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1423408027-49694-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/glibc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 37e108e..890d007 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_19
+	default BR2_GLIBC_VERSION_2_20
 
 config BR2_GLIBC_VERSION_2_19
 	bool "2.19"
-- 
1.7.1
