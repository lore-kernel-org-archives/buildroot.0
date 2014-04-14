From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 15 Apr 2014 00:31:03 +0200
Subject: [Buildroot] [PATCH v8 0/6] PATH cleanup
Message-ID: <1397514669-19362-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Just a quick rebase for the 8th round of this series.

Yours,
Samuel

Samuel Martin (6):
  Makefile: introduce BR_PATH
  Makefile: add $(HOST_DIR)/sbin to BR_PATH
  *.mk: replace (TARGET|HOST)_PATH by BR_PATH
  infra: remove unused {TARGET, HOST}_PATH definition
  pkg-cmake.mk: add PATH in the configure command environment
  Makefile: add PATH to the USER_HOOKS_EXTRA_ENV

 Makefile                 |  3 +++
 fs/ext2/ext2.mk          |  2 +-
 package/Makefile.in      | 13 +++++--------
 package/gpm/gpm.mk       |  2 +-
 package/libhid/libhid.mk |  2 +-
 package/pkg-cmake.mk     |  2 ++
 package/pkg-python.mk    |  8 ++++----
 package/sdl/sdl.mk       |  2 +-
 package/xbmc/xbmc.mk     |  2 +-
 package/znc/znc.mk       |  2 +-
 10 files changed, 20 insertions(+), 18 deletions(-)

--
1.9.2
