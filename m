From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat,  3 Aug 2019 11:38:55 +0200
Subject: [Buildroot] [PATCH v2 0/3] Update package mosquitto
Message-ID: <20190803093858.144555-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset extend the mosquitto integration with Buildroot's
build system and systemd, thanks to configuration options that have
been introduced in mosquitto 1.5. Finally, it updates the help text
in Config.in and add myself to the DEVELOPERS.

Changes in v2:
    - Explicit dependency on systemd when enabled
    - Broker needs dylibs
    - Update help text and DEVELOPERS

Titouan Christophe (3):
  package/mosquitto: allow to build as static lib
  package/mosquitto: extend systemd integration
  package/mosquitto: update help text in Config.in

 DEVELOPERS                          |  1 +
 package/mosquitto/Config.in         | 31 +++++++++++++++++------------
 package/mosquitto/mosquitto.mk      | 19 +++++++++++++++++-
 package/mosquitto/mosquitto.service | 10 ----------
 4 files changed, 37 insertions(+), 24 deletions(-)
 delete mode 100644 package/mosquitto/mosquitto.service

-- 
2.21.0
