From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 16 Apr 2020 14:29:38 +0200
Subject: [Buildroot] [PATCH v2 0/2] Add netopeer2 server and cli package
Message-ID: <20200416122939.10312-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds netopeer2 support to buildroot (cli and server).

---
Changes v1 -> v2:
- remove unneeded selects formerly coming from sysrepo
 - BR2_PACKAGE_LIBAVL
 - BR2_PACKAGE_LIBEV
 - BR2_PACKAGE_PROTOBUF_C

Heiko Thiery (2):
  package/netopeer2-server: add package
  package/netopeer2-cli: add package

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  2 +
 package/netopeer2-cli/Config.in               | 20 ++++++++
 package/netopeer2-cli/netopeer2-cli.hash      |  1 +
 package/netopeer2-cli/netopeer2-cli.mk        | 17 +++++++
 package/netopeer2-server/Config.in            | 43 ++++++++++++++++
 package/netopeer2-server/S52netopeer2-server  | 50 +++++++++++++++++++
 .../netopeer2-server/netopeer2-server.hash    |  3 ++
 package/netopeer2-server/netopeer2-server.mk  | 21 ++++++++
 9 files changed, 159 insertions(+)
 create mode 100644 package/netopeer2-cli/Config.in
 create mode 120000 package/netopeer2-cli/netopeer2-cli.hash
 create mode 100644 package/netopeer2-cli/netopeer2-cli.mk
 create mode 100644 package/netopeer2-server/Config.in
 create mode 100644 package/netopeer2-server/S52netopeer2-server
 create mode 100644 package/netopeer2-server/netopeer2-server.hash
 create mode 100644 package/netopeer2-server/netopeer2-server.mk

-- 
2.20.1
