From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:43:04 +0200
Subject: [Buildroot] [PATCH 0/8] Cleanup VoIP packages and add linphone
Message-ID: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 057c729c2438107b426576121bcf83f792734a6f:

  external-toolchain: add support for Linaro 2012.04 (2012-05-07 17:08:37 +0200)

are available in the git repository at:
  git://github.com/lucaceresoli/buildroot.git voip

Luca Ceresoli (8):
  speex: remove redundant SPEEX_SOURCE definition
  libogg: remove redundant LIBOGG_SOURCE definition
  libogg: document project URL and update description in menuconfig
  libosip2: document project URL in menuconfig
  libosip2: remove redundant LIBOSIP2_SOURCE definition
  libeXosip2: fix comment and URL in menuconfig
  libeXosip2: remove redundant LIBOSIP2_SOURCE definition
  linphone: new package

 package/Config.in                |    1 +
 package/libeXosip2/Config.in     |   14 ++++++++------
 package/libeXosip2/libeXosip2.mk |    1 -
 package/libogg/Config.in         |    8 ++++++--
 package/libogg/libogg.mk         |    1 -
 package/libosip2/Config.in       |    2 ++
 package/libosip2/libosip2.mk     |    1 -
 package/linphone/Config.in       |   21 +++++++++++++++++++++
 package/linphone/linphone.mk     |   12 ++++++++++++
 package/speex/speex.mk           |    5 ++---
 10 files changed, 52 insertions(+), 14 deletions(-)
 create mode 100644 package/linphone/Config.in
 create mode 100644 package/linphone/linphone.mk

-- 
1.7.5.4
