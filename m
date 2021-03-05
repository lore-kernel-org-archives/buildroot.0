From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  5 Mar 2021 16:15:27 +0100
Subject: [Buildroot] [PATCH 0/2] package/belle-sip: work around bug 99410
Message-ID: <20210305151529.3477575-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This pachset introduces gcc bug 99410 and uses it work around package
belle-sip.

Giulio Benetti (2):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_99410
  package/belle-sip: fix build failure due to gcc bug 99410

 package/belle-sip/belle-sip.mk | 8 ++++++++
 toolchain/Config.in            | 7 +++++++
 2 files changed, 15 insertions(+)

-- 
2.25.1
