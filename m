From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 01:07:35 -0700
Subject: [Buildroot] [PATCH 2/2] netkittelnet: mark as deprecated
In-Reply-To: <1286266055-23083-1-git-send-email-Martin.Banky@gmail.com>
References: <1286266055-23083-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286266055-23083-3-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

10+ years old, and is no longer being maintained

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/netkittelnet/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index 058d210..027db32 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
 	depends on BR2_INET_RPC
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_NETKITBASE
 	help
 	  Standard Linux telnet client and server.
-- 
1.7.3.1
