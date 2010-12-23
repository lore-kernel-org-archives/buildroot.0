From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Thu, 23 Dec 2010 13:40:37 +0100
Subject: [Buildroot] [PATCH v2] libmodbus package
Message-ID: <1293108038-24759-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix Thomas comments:
- move to networking libraries
- add to staging directory

Marek Belisko (1):
  Add libmodbus to buildroot.

 package/Config.in              |    1 +
 package/libmodbus/Config.in    |    9 +++++++++
 package/libmodbus/libmodbus.mk |    9 +++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/libmodbus/Config.in
 create mode 100644 package/libmodbus/libmodbus.mk
