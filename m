From: Anton Kuzmin <ak@aries-embedded.de>
Date: Sat, 14 Jul 2018 09:09:38 +0200
Subject: [Buildroot] [PATCH 0/2] support for RISC-V architecture
Message-ID: <ff182eac-12ea-7ad6-df8c-8ec9c257fece@aries-embedded.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set adds basic support for RISC-V ISA.

Only 64-bit glibc toolchain/sdk are built at the moment.

Anton Kuzmin (2):
  riscv: add support for RISC-V Instruction Set
  toolchain-buildroot: add support for RISC-V Instruction Set
    Architecture

 Makefile                                |  3 +-
 arch/Config.in                          | 13 +++++
 arch/Config.in.riscv                    | 77 +++++++++++++++++++++++++
 arch/arch.mk.riscv                      | 18 ++++++
 toolchain/toolchain-buildroot/Config.in |  3 +-
 5 files changed, 112 insertions(+), 2 deletions(-)
 create mode 100644 arch/Config.in.riscv
 create mode 100644 arch/arch.mk.riscv

-- 
2.18.0
