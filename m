From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 16 Dec 2011 09:52:11 +0100
Subject: [Buildroot] [PATCH 0 of 5 v5] dependencies: some improvements
Message-ID: <patchbomb.1324025231@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4: add Acks by ThomasP and update after feedback
v5: add extra patch to fix download problem because dl dir is absent

 Makefile                               |   10 +++++++++-
 package/Makefile.package.in            |   12 ------------
 package/tar/tar.mk                     |   12 ++++++++++++
 support/dependencies/check-host-tar.mk |    9 +++++++++
 support/dependencies/check-host-tar.sh |   35 +++++++++++++++++++++++++++++++++++
 toolchain/dependencies/dependencies.mk |   12 +++++++++++-
 toolchain/dependencies/dependencies.sh |  Bin
 toolchain/toolchain-buildroot.mk       |    1 -
 toolchain/toolchain-crosstool-ng.mk    |    1 -
 toolchain/toolchain-external.mk        |    1 -
 10 files changed, 76 insertions(+), 17 deletions(-)
