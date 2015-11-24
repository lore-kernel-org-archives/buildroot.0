From: Cyril Bur <cyrilbur@gmail.com>
Date: Wed, 25 Nov 2015 10:53:41 +1100
Subject: [Buildroot] [PATCH] Add Linux kernel selftests building
Message-ID: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Being able to boot and run the kernel selftests on development machines has
proven very useful recently.

The one caveat in this patch is that the kernel selftests and associated
build infrastructure leaves a bit to be desired so enabling the option
makes the build messy, nothing much we can do here and I'm assuming that
anyone turns it on, they know what they're doing anyway.

Cyril Bur (1):
  linux: Build and install kernel selftests

 linux/Config.tools.in         | 12 ++++++++++++
 linux/linux-tool-selftests.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 linux/linux-tool-selftests.mk

-- 
2.6.2
