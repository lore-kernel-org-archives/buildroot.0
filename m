From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 30 Jan 2014 21:38:47 +0100
Subject: [Buildroot] [PATCH v3 0/6] PATH cleanup
Message-ID: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Here is the 3rd round of the PATH cleanup series.
In this round, there is no change, but rebasing on top of master and
commit log rewording/enhancement.

Yours,
Samuel


Samuel Martin (6):
  Makefile: introduce BR2_PATH
  Makefile: add $(HOST_DIR)/sbin to BR2_PATH
  *.mk: replace (TARGET|HOST)_PATH by BR2_PATH
  infra: remove unused {TARGET,HOST}_PATH definition
  pkg-cmake.mk: add PATH in the configure command environment
  Makefile: export PATH

 Makefile                 |  4 ++++
 fs/ext2/ext2.mk          |  2 +-
 package/Makefile.in      | 12 ++++--------
 package/bustle/bustle.mk |  2 +-
 package/libhid/libhid.mk |  2 +-
 package/pkg-cmake.mk     |  2 ++
 package/pkg-python.mk    |  8 ++++----
 package/sdl/sdl.mk       |  2 +-
 8 files changed, 18 insertions(+), 16 deletions(-)

--
1.8.5.3
