From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 17 Jul 2018 22:48:53 +0200
Subject: [Buildroot] [PATCH 0/3] Bump rust to 1.27.1
Message-ID: <20180717204856.6128-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This tiny series bumps rust and rust-bin to 1.27.1 as well as cargo-bin to
0.27.

The cargo package is not bumped, as the source code is now included in the
rust tarball and should be built from it. So this will be added in a future
patch.

Eric Le Bihan (3):
  rust-bin: bump version to 1.27.1
  rust: bump version to 1.27.1
  cargo-bin: bump version to 0.27.0

 package/cargo-bin/cargo-bin.hash                   | 12 ++---
 package/cargo-bin/cargo-bin.mk                     |  2 +-
 package/rust-bin/rust-bin.hash                     | 60 +++++++++++-----------
 package/rust-bin/rust-bin.mk                       |  2 +-
 ...-Fix-warnings-in-library-from-error-chain.patch | 25 +++++++++
 ...mit-warnings-inside-error-chain-expansion.patch | 25 +++++++++
 package/rust/rust.hash                             |  4 +-
 package/rust/rust.mk                               |  2 +-
 8 files changed, 91 insertions(+), 41 deletions(-)
 create mode 100644 package/rust/0001-Fix-warnings-in-library-from-error-chain.patch
 create mode 100644 package/rust/0001-Permit-warnings-inside-error-chain-expansion.patch

--
2.14.4
