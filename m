From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Jan 2011 22:55:37 +0100
Subject: [Buildroot] [git commit master 1/1] binutils: make it a proper
	package
Message-ID: <20110102220443.11D908F346@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=009407e6be898abedb308247a82e4dee525e6570
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Convert binutils to a proper autotargets package

* Add version 2.21 and drop version 2.17

* Hook up packaged binutils for target gcc

* Build tools are on HOST_DIR now so change it

* Move cross/host gcc to HOST_DIR

* Drop kludge from commit 3c77bab2eeace3ee675bd745ca335fa3dd1630bb
  This is fixed in the next commit "gcc: install copies of libgcc,
  libstdc++ and libgcj to the sysroot" - tested for arm & x86_64
  targets.

* TARGET_CROSS now pointed to HOST_DIR too

[Peter: Config.in tweaks]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
