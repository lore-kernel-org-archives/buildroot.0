From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 26 Oct 2014 14:17:24 +0100
Subject: [Buildroot] [PATCH 0/2] Portability fixes for "make menuconfig"
Message-ID: <1414329446-16587-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here are two portability fixes needed to be able to run "make menuconfig" on
NixOS[1].

[1]: http://nixos.org/

Bj?rn Forsman (2):
  kconfig/lxdialog: get ncurses CFLAGS with pkg-config
  Makefile: pass host PKG_CONFIG_PATH at "make menuconfig" time

 Makefile                                   | 6 +++++-
 support/kconfig/lxdialog/check-lxdialog.sh | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 support/kconfig/lxdialog/check-lxdialog.sh

-- 
2.1.2
