From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 19 Aug 2012 21:08:42 +0100
Subject: [Buildroot] [PATCH 2/4] zeromq: add license information
In-Reply-To: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
References: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
Message-ID: <1345406924-6574-2-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zeromq/zeromq.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index f5e530d..7b53fa9 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -8,5 +8,7 @@ ZEROMQ_VERSION = 2.1.11
 ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
+ZEROMQ_LICENSE = GPLv3+
+ZEROMQ_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.9.5
