From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 12 Apr 2007 00:19:12 +0200
Subject: [Buildroot] LINUX_HEADERS_DIR
Message-ID: <001501c77c87$75b60200$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Today we define this as:

LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux

which means that the Linux Headers is not part of the toolchain built by buildroot

At first sight, it appears to me that you could as well have 

LINUX_HEADERS_DIR:=$(STAGING_DIR)

Any reason not to change to this?

Best Regards
Ulf Samuelsson
