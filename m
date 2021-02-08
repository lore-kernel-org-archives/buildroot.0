From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Mon,  8 Feb 2021 16:11:04 +0100
Subject: [Buildroot] [PATCH 0/2] Add usbguard support
Message-ID: <20210208151106.196836-1-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is small series adding support for the usbguard framework.

Please note that the libqb is a required dependency.

Greetings,

Kamel Bouhara (2):
  package/libqb: new package
  package/usbguard: new package

 DEVELOPERS                     |  3 +++
 package/Config.in              |  2 ++
 package/libqb/Config.in        |  7 +++++++
 package/libqb/libqb.hash       |  3 +++
 package/libqb/libqb.mk         | 15 +++++++++++++++
 package/usbguard/Config.in     | 19 +++++++++++++++++++
 package/usbguard/usbguard.hash |  3 +++
 package/usbguard/usbguard.mk   | 40 ++++++++++++++++++++++++++++++++++++++++
 8 files changed, 92 insertions(+)
 create mode 100644 package/libqb/Config.in
 create mode 100644 package/libqb/libqb.hash
 create mode 100644 package/libqb/libqb.mk
 create mode 100644 package/usbguard/Config.in
 create mode 100644 package/usbguard/usbguard.hash
 create mode 100644 package/usbguard/usbguard.mk

-- 
2.11.0
