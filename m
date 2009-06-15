From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jun 2009 21:19:46 +0200
Subject: [Buildroot] [pull request] external toolchain
Message-ID: <1245093588-17565-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 220dca451ef4b2f680ca35caacb29f6a6138068a:
  Nigel Kukard (1):
        dmraid linking against host system fix

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot external-toolchain

Thomas Petazzoni (2):
      Simple glibc-based external toolchain support
      Improve external toolchain checks

 toolchain/external-toolchain/Config.in   |   25 ++++------
 toolchain/external-toolchain/ext-tool.mk |   75 ++++++++++++++++++++++++++---
 2 files changed, 77 insertions(+), 23 deletions(-)
