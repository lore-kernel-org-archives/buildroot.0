From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Wed, 21 Aug 2013 16:58:46 -0300
Subject: [Buildroot] [PATCH v2 0/2] Introducing Nios-II architecture
Message-ID: <1377115128-29749-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This is the second version of the series adding basic support for
Altera's Nios-II architecture.
Only basic support added so far, but more patches will hopefully follow.

Changes from v1:

  * Added details about toolchain components version
  * Removed Sourcery version 2013.05-12 and left 2013.05-43 only
  * Excluded internal and crosstool-ng toolchains as they're
    not supported (yet?)

Many thanks to Zylin (www.zylin.com) for supporting this!

Ezequiel Garcia (2):
  nios2: Add new architecture
  toolchain-external: Add Sourcery CodeBench for Nios-II

 arch/Config.in                           | 11 +++++++++++
 arch/Config.in.nios2                     |  5 +++++
 toolchain/Config.in                      |  5 +++--
 toolchain/toolchain-external/Config.in   | 14 ++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |  3 +++
 5 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 arch/Config.in.nios2

-- 
1.8.1.5
