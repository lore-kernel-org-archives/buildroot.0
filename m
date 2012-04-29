From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 10:51:14 +0200
Subject: [Buildroot] [git commit] busybox: add new 1.20.0, remove deprecated,
	mark 1.18.x deprecated
Message-ID: <20120429090502.321EE96C08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b59f9e1562395411d10b8137ffd69e0ab573c6e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add version 1.20.0, remove deprecated 1.16.x & 1.17.x versions and mark
1.18.x as deprecated.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                          |   22 +-
 .../busybox/busybox-1.16.2/busybox-devmem.patch    |   76 --
 package/busybox/busybox-1.16.x.config              |  920 --------------------
 .../busybox-1.20.0/busybox-1.20.0-getty.patch      |   17 +
 .../busybox-1.20.0/busybox-1.20.0-lineedit.patch   |   22 +
 .../busybox-1.20.0/busybox-1.20.0-sed.patch        |   29 +
 ...busybox-1.17.x.config => busybox-1.20.x.config} |  206 +++--
 7 files changed, 208 insertions(+), 1084 deletions(-)

Patch is too large, so refusing to show it
