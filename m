From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 24 May 2017 13:30:28 -0700
Subject: [Buildroot] [PATCH 0/2] Add host acpica support
Message-ID: <20170524203030.8187-1-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for buildling the acpica package for the host.

This fixes the Xen build issue when iasl is missing.
Reported here:
http://autobuild.buildroot.net/results/afa/afa199864d6b546fe759bb582a9c10702ea7fa78/

Alistair Francis (2):
  package: acpica: Add host buildling support
  package: xen: Depend on the host-acpica package

 package/acpica/acpica.mk | 12 ++++++++++++
 package/xen/xen.mk       |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.11.0
