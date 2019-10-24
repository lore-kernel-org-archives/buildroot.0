From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 24 Oct 2019 20:16:18 +0200
Subject: [Buildroot] [PATCH v2 0/3] Add support for the D programming
 language
Message-ID: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small series add supports for the D programming language, available in
GCC since version 9.1.

v1 -> v2:

 - restrict support for Buildroot toolchain to some architectures.
 - add support for external toolchain.

Eric Le Bihan (3):
  toolchain: add support for D language
  package/gcc: add support for D language
  toolchain-external: add support for D language

 package/gcc/Config.in.host                    | 22 +++++++++++++++++++
 package/gcc/gcc-final/gcc-final.mk            |  5 +++++
 toolchain/Config.in                           |  3 +++
 .../pkg-toolchain-external.mk                 |  4 ++++
 .../Config.in.options                         |  8 +++++++
 5 files changed, 42 insertions(+)

--
2.21.0
