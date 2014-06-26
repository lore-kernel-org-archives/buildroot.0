From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:02 -0300
Subject: [Buildroot] [PATCH 34/53] libyaml: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-34-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libyaml/libyaml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 28ed77a..0a42742 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -8,5 +8,7 @@ LIBYAML_VERSION = 0.1.6
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 LIBYAML_SITE = http://pyyaml.org/download/libyaml/
 LIBYAML_INSTALL_STAGING = YES
+LIBYAML_LICENSE = MIT
+LIBYAML_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
1.8.5.5
