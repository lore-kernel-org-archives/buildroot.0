From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Mar 2019 10:58:26 +1030
Subject: [Buildroot] [PATCH v2 0/4] Linux kernel 5.0 support
Message-ID: <20190321002830.21863-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v2 address Thomas' review
 - Fix 'toolchain: Add necessary options...' and move to the start of
   the series
 - Add toolchain-external-custom patch

Joel Stanley (4):
  toolchain: Add necessary options to support 5.0 kernel headers
  package/linux-headers: add support for Linux 5.0 kernel headers
  linux: add support for Linux 5.0
  toolchain/toolchain-external-custom: Support Linux 5.0 kernel headers

 linux/Config.in                                     |  6 ++----
 linux/linux.hash                                    |  2 ++
 package/linux-headers/Config.in.host                | 13 ++++++++++---
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  4 ++++
 5 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.20.1
