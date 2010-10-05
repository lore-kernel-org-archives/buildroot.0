From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 01:07:34 -0700
Subject: [Buildroot] [PATCH 1/2] netkitbase: mark as deprecated
In-Reply-To: <1286266055-23083-1-git-send-email-Martin.Banky@gmail.com>
References: <1286266055-23083-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286266055-23083-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

10+ years old, and is no longer being maintained

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/netkitbase/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index 725e500..e11309e 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
 	depends on BR2_INET_RPC
+	depends on BR2_DEPRECATED
 	help
 	  Old-style inetd.
 
-- 
1.7.3.1
