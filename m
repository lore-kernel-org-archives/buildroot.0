From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:32 +0100
Subject: [Buildroot] [PATCH 00/26] Add hash for license file in some packages
Message-ID: <20200122081657.31817-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bunch of patches that adds the license file hashes.

The packages are tests with: make <pkg>-legal-info


Heiko Thiery (26):
  package/crudini: add hash for license file
  package/netcat: add hash for license file
  package/phytool: add hash for license file
  package/python-iniparser: add hash for license file
  package/4th: add hash for license file
  package/alure: add hash for license file
  package/atest: add hash for license file
  package/atf: add hash for license file
  package/audiofile: add hash for license file
  package/bcache-tools: add hash for license file
  package/bmon: add hash for license file
  package/bridge-utils: add hash for license file
  package/cgic: add hash for license file
  package/aumix: add hash for license file
  package/cpuload: add hash for license file
  package/ctorrent: add hash for license file
  package/curlftpfs: add hash for license file
  package/czmq: fix typo for LICNESE hash
  package/daemon: add hash for license file
  package/dbus-cpp: add hash for license file
  package/dhcpdump: add hash for license file
  package/dieharder: add hash for license file
  package/acpitool: add hash for license file
  package/autoconf-archive: add hash for license file
  package/angular-websocket: add hash for license file
  package/axel: add hash for license file

 package/4th/4th.hash                             | 1 +
 package/acpitool/acpitool.hash                   | 1 +
 package/alure/alure.hash                         | 1 +
 package/angular-websocket/angular-websocket.hash | 1 +
 package/atest/atest.hash                         | 1 +
 package/atf/atf.hash                             | 1 +
 package/audiofile/audiofile.hash                 | 2 ++
 package/aumix/aumix.hash                         | 1 +
 package/autoconf-archive/autoconf-archive.hash   | 1 +
 package/axel/axel.hash                           | 2 ++
 package/bcache-tools/bcache-tools.hash           | 1 +
 package/bmon/bmon.hash                           | 2 ++
 package/bridge-utils/bridge-utils.hash           | 3 +++
 package/cgic/cgic.hash                           | 1 +
 package/cpuload/cpuload.hash                     | 1 +
 package/crudini/crudini.hash                     | 7 +++++--
 package/ctorrent/ctorrent.hash                   | 3 +++
 package/curlftpfs/curlftpfs.hash                 | 1 +
 package/czmq/czmq.hash                           | 2 +-
 package/daemon/daemon.hash                       | 1 +
 package/dbus-cpp/dbus-cpp.hash                   | 1 +
 package/dhcpdump/dhcpdump.hash                   | 1 +
 package/dieharder/dieharder.hash                 | 1 +
 package/netcat/netcat.hash                       | 1 +
 package/phytool/phytool.hash                     | 1 +
 package/python-iniparse/python-iniparse.hash     | 8 ++++++--
 26 files changed, 42 insertions(+), 5 deletions(-)

-- 
2.20.1
