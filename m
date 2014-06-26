From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:10 -0300
Subject: [Buildroot] [PATCH 42/53] read-edid: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-42-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/read-edid/read-edid.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
index 02d80d0..0cc576d 100644
--- a/package/read-edid/read-edid.mk
+++ b/package/read-edid/read-edid.mk
@@ -6,6 +6,8 @@
 
 READ_EDID_VERSION = 1.4.2
 READ_EDID_SITE = http://www.polypux.org/projects/read-edid/
+READ_EDID_LICENSE = GPLv2
+READ_EDID_LICENSE_FILES = COPYING
 
 define READ_EDID_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
1.8.5.5
