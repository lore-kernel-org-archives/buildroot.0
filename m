From: Anders Blomdell <anders.blomdell@control.lth.se>
Date: Sun, 12 Oct 2008 12:16:24 +0200
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG and Atmel targets
Message-ID: <48F1CE78.3040908@control.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in target/device/Atmel/atngw100/Makefile.in there is a line

BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox-1.9.1.config

unfortunately this makes it impossible to change busybox config 
(primarily I want to turn off telnet) to a custom version. What is the 
correct way to handle this?

Regards

Anders Blomdell
