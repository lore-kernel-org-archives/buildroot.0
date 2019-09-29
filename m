From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 18:55:59 +0200
Subject: [Buildroot] [PATCH 0/2] Add support for the D programming language
Message-ID: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small series add supports for the D programming language, available in
GCC since version 9.1.

Eric Le Bihan (2):
  toolchain: add support for D language
  package/gcc: add support for D language

 package/gcc/Config.in.host         | 10 ++++++++++
 package/gcc/gcc-final/gcc-final.mk |  5 +++++
 toolchain/Config.in                |  3 +++
 3 files changed, 18 insertions(+)

--
2.21.0
