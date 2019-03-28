From: Ed Blake <ed.blake@sondrel.com>
Date: Thu, 28 Mar 2019 18:48:14 +0000
Subject: [Buildroot] [PATCH 0/2] Add OpenMP support for custom external
 toolchains
Message-ID: <cover.1553798445.git.ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds OpenMP support for custom external toolchains. The first
patch adds a new 'BR2_TOOLCHAIN_EXTERNAL_OPENMP' option for custom external
toolchains to enable OpenMP support, and the second patch adds a check that
the toolchain has OpenMP support.

Ed Blake (2):
  toolchain-external: introduce BR2_TOOLCHAIN_EXTERNAL_OPENMP
  toolchain-external: add a check for OpenMP support

 toolchain/helpers.mk                           | 18 ++++++++++++++++++
 .../pkg-toolchain-external.mk                  |  3 +++
 .../Config.in.options                          |  8 ++++++++
 3 files changed, 29 insertions(+)

-- 
2.17.1
