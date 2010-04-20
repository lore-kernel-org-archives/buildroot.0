From: William Wagner <will_wagner@carallon.com>
Date: Tue, 20 Apr 2010 11:37:08 +0100
Subject: [Buildroot] makedev questions
Message-ID: <4BCD83D4.6000306@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just trying to get everything working again following recent changes in 
git. After the makedev change I have a couple of questions.

Should the default value for BR2_PACKAGE_MAKEDEVS not be y? Without it 
you get a rootfs without any device nodes. Or am I missing something?

Also am I right to think that TARGET_DEVICE_TABLE has been removed? 
There still appears to be a reference to it at 
package\busybox\initramfs.mk(106): echo "$(HOST_DIR)/usr/bin/makedevs -d 
$(TARGET_DEVICE_TABLE) $(BUILD_DIR)/initramfs"; \

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
