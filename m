From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Nov 2014 14:18:46 +0100
Subject: [Buildroot] [PATCH 0/3] quota fixes, fix bug #7574
Message-ID: <1415539129-25721-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The aim of this series is to fix bug #7574, i.e make sure quota builds
fine in static library configuration. While doing so, I found some
other things to fix in quota, especially removing the util-linux
dependency.

Thomas

Thomas Petazzoni (3):
  quota: rename patch to the new convention
  quota: remove dependency on util-linux
  quota: fix static linking

 ...ynumber.patch => 01-tools-getrpcbynumber.patch} |  0
 package/quota/02-fix-static-linking.patch          | 55 ++++++++++++++++++++++
 package/quota/Config.in                            |  6 +--
 3 files changed, 56 insertions(+), 5 deletions(-)
 rename package/quota/{quota-01-tools-getrpcbynumber.patch => 01-tools-getrpcbynumber.patch} (100%)
 create mode 100644 package/quota/02-fix-static-linking.patch

-- 
2.0.0
