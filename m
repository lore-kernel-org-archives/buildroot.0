From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Feb 2014 15:34:49 +0100
Subject: [Buildroot] [PATCH v1 0/6] vlc: autobuilder fixes
Message-ID: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Here is a series that fixes a couple of aubuilder failures because of vlc.

Yours,
Samuel

Samuel Martin (6):
  vlc: fix svg support
  vlc: fix bonjour support
  vlc: fix live555 support
  vlc: fix libgcrypt support
  vlc: fix sdl support
  vlc: enable altivec support only when appropriate

 ...ac-add-check-for-libgcrypt-config-program.patch | 43 ++++++++++++++++++++++
 package/vlc/vlc.mk                                 | 32 +++++++++++++---
 2 files changed, 69 insertions(+), 6 deletions(-)
 create mode 100644 package/vlc/vlc-0002-configure.ac-add-check-for-libgcrypt-config-program.patch

--
1.8.5.4
