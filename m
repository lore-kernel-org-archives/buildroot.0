From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 20 Aug 2013 08:59:59 -0300
Subject: [Buildroot] [PATCH 0/2] Introducing Nios-II architecture
Message-ID: <1376999999-3357-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This two patches add very basic support for Altera's Nios-II
architecture.

It's interesting to note, Buildroot used to had such support but it
was removed as documented in the CHANGES file.

I plan to upstream more patches to enhance this support:
*always* focusing in MMU, and *never* in MMU-less builds.

Enjoy!

Ezequiel Garcia (2):
  nios2: Add new architecture
  toolchain-external: Add Sourcery CodeBench for Nios-II

 arch/Config.in                           | 11 +++++++++++
 arch/Config.in.nios2                     |  5 +++++
 toolchain/toolchain-external/Config.in   | 26 ++++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |  6 ++++++
 4 files changed, 48 insertions(+)
 create mode 100644 arch/Config.in.nios2

-- 
1.8.1.5
