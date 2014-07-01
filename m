From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:32:48 +0200
Subject: [Buildroot] [git commit] read-edid: add license information
Message-ID: <20140701224922.4CF7A9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59ffa187c648751d1cae2a14c47eb9c3c84ee376
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/read-edid/read-edid.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
