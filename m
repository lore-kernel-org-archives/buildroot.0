From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 19 Jan 2017 13:01:48 +0100
Subject: [Buildroot] [PATCH v2 0/2] libgpiod: new package
Message-ID: <1484827310-13779-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v1 -> v2:
- split the patch into two - the second updating the DEVELOPERS file
- use the github helper for download
- remove 'LIBGPIOD_AUTORECONF_OPTS = --install' as this is already
  handled internally
- use --enable/--disable instead of --enable=yes/--enable=no

Bartosz Golaszewski (2):
  libgpiod: new package
  DEVELOPERS: add Bartosz Golaszewski as developer of package/libgpiod

 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libgpiod/Config.in     | 20 ++++++++++++++++++++
 package/libgpiod/libgpiod.hash |  2 ++
 package/libgpiod/libgpiod.mk   | 14 ++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/libgpiod/Config.in
 create mode 100644 package/libgpiod/libgpiod.hash
 create mode 100644 package/libgpiod/libgpiod.mk

-- 
2.9.3
