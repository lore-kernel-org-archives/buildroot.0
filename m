From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  2 May 2018 11:53:29 +0200
Subject: [Buildroot] [PATCH 0/4] Bump Rust packages
Message-ID: <20180502095333.26940-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series provides rust 1.25.0 and cargo 0.26.0.

Eric Le Bihan (4):
  rust-bin: bump version to 1.25.0
  rust: bump version to 1.25.0
  cargo-bin: bump version to 0.26.0
  cargo: bump version to 0.26.0

 package/cargo-bin/cargo-bin.hash |  8 +++---
 package/cargo-bin/cargo-bin.mk   |  2 +-
 package/cargo/cargo.hash         |  6 ++--
 package/cargo/cargo.mk           |  4 +--
 package/rust-bin/rust-bin.hash   | 60 ++++++++++++++++++++--------------------
 package/rust-bin/rust-bin.mk     |  6 ++--
 package/rust/rust.hash           |  4 +--
 package/rust/rust.mk             |  2 +-
 8 files changed, 46 insertions(+), 46 deletions(-)

--
2.14.3
