From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:31:35 +0200
Subject: [Buildroot] [git commit] argus: bump to vanilla version 3.6.0.1
Message-ID: <20140618123420.8F8FD9D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=632a954a0e0a9217f491de5b62cc6db3298869e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All of the new toolchain requirements (ipv6, threads, rpc) aren't
actually new - this package failed to build for ages, it just wasn't
picked up by the autobuilders because the main Makefile just doesn't
care about bailing out properly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/argus/Config.in                            |    7 +
 package/argus/argus-0001-drop-susv3-legacy.patch   | 1460 ++++++++++++++++++++
 .../argus/argus-3.0.0.rc.34-00-susv3-legacy.patch  | 1278 -----------------
 .../argus-3.0.0.rc.34-01-use-pcap-header.patch     |   27 -
 package/argus/argus.mk                             |   23 +-
 5 files changed, 1478 insertions(+), 1317 deletions(-)

Patch is too large, so refusing to show it
