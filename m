From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu,  9 Jan 2020 15:53:32 +0100
Subject: [Buildroot] [PATCH 0/2] Add netopeer2 packages (server and cli)
Message-ID: <20200109145339.14445-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

This patchset includes the packages for netopeer2-server and netopeer2-cli.

Netopeer is a set of tools implementing network configuration tools
based on the NETCONF protocol.

Heiko Thiery (2):
  package/netopeer2-server: add package
  package/netopeer2-cli: add package

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  2 +
 package/netopeer2-cli/Config.in               | 20 ++++++++
 package/netopeer2-cli/netopeer2-cli.hash      |  1 +
 package/netopeer2-cli/netopeer2-cli.mk        | 17 +++++++
 package/netopeer2-server/Config.in            | 49 ++++++++++++++++++
 package/netopeer2-server/S52netopeer2-server  | 50 +++++++++++++++++++
 .../netopeer2-server/netopeer2-server.hash    |  2 +
 package/netopeer2-server/netopeer2-server.mk  | 21 ++++++++
 9 files changed, 164 insertions(+)
 create mode 100644 package/netopeer2-cli/Config.in
 create mode 120000 package/netopeer2-cli/netopeer2-cli.hash
 create mode 100644 package/netopeer2-cli/netopeer2-cli.mk
 create mode 100644 package/netopeer2-server/Config.in
 create mode 100644 package/netopeer2-server/S52netopeer2-server
 create mode 100644 package/netopeer2-server/netopeer2-server.hash
 create mode 100644 package/netopeer2-server/netopeer2-server.mk

-- 
2.20.1
