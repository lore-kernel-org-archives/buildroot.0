From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Nov 2014 14:30:51 +0100
Subject: [Buildroot] [PATCHv2 0/3] quota fixes, fix bug #7574
Message-ID: <1415539854-25971-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Same set of fixes for quota, this time with the proper changes to
quota.mk that were missing from the third patch.

Thomas

Thomas Petazzoni (3):
  quota: rename patch to the new convention
  quota: remove dependency on util-linux
  quota: fix static linking

 ...ynumber.patch => 01-tools-getrpcbynumber.patch} |  0
 package/quota/02-fix-static-linking.patch          | 55 ++++++++++++++++++++++
 package/quota/Config.in                            |  6 +--
 package/quota/quota.mk                             |  9 ++--
 4 files changed, 60 insertions(+), 10 deletions(-)
 rename package/quota/{quota-01-tools-getrpcbynumber.patch => 01-tools-getrpcbynumber.patch} (100%)
 create mode 100644 package/quota/02-fix-static-linking.patch

-- 
2.0.0
