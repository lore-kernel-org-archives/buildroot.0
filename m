From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  8 Aug 2018 10:45:57 +0200
Subject: [Buildroot] [PATCH 0/2] Bump rust to 1.27.2
Message-ID: <20180808084559.3009-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small series bumps rust and rust-bin to the 1.27.2 bugfix release.

Eric Le Bihan (2):
  rust-bin: bump version to 1.27.2
  rust: bump version to 1.27.2

 package/rust-bin/rust-bin.hash | 60 +++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |  2 +-
 package/rust/rust.hash         |  4 +--
 package/rust/rust.mk           |  3 ++-
 4 files changed, 35 insertions(+), 34 deletions(-)

--
2.14.4
