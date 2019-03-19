From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Mar 2019 10:36:35 +1030
Subject: [Buildroot] [PATCH 0/3] Linux kernel 5.0 support
Message-ID: <20190319000638.6259-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joel Stanley (3):
  package/linux-headers: add support for Linux 5.0 kernel headers
  toolchain: Add necessary options to support 5.0 kernel headers
  linux: add support for Linux 5.0

 linux/Config.in                      |  6 ++----
 linux/linux.hash                     |  2 ++
 package/linux-headers/Config.in.host | 13 ++++++++++---
 toolchain/Config.in                  |  5 +++++
 4 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.20.1
