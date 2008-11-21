From: <bogus@does.not.exist.com>
Date: Fri, 21 Nov 2008 01:22:55 -0000
Subject: No subject
Message-ID: <mailman.3.1228348835.1345.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

	DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26

And 4 lines further down this is even used directly.
This tool is pulled through this dependency:

linux26-modules: cross-depmod26 $(LINUX26_DIR)/.modules_installed

And this cross-depmod26 is provided by module-init-tools.


Nicolas
