From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:25:53 +0100
Subject: [Buildroot] [PATCHv2 0/3] Misc autobuilder fixes
Message-ID: <1419697556-32541-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Second version of the libxmlrpc/xerces fixes. Changes since v1:

 - Drop patches that were merged.

 - Add hash file for libxmlrpc, as suggested by Yann.

Thomas

Thomas Petazzoni (3):
  libxmlrpc: bump to 1.25.30 and add hash file
  libxmlrpc: improve curl-config patch
  xerces: make sure to use the cross-compiled curl

 .../libxmlrpc/0004-use-correct-curl-config.patch   | 82 ++++++++++++++++++++--
 package/libxmlrpc/libxmlrpc.hash                   |  2 +
 package/libxmlrpc/libxmlrpc.mk                     | 11 ++-
 package/xerces/xerces.mk                           |  2 +-
 4 files changed, 90 insertions(+), 7 deletions(-)
 create mode 100644 package/libxmlrpc/libxmlrpc.hash

-- 
2.1.0
