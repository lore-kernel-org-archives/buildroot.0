From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 11:49:54 +0100
Subject: [Buildroot] [PATCH v3 0/5] Latest fixings to Mender
Message-ID: <1549363799-30840-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series tries to ressurect the efforts Mizra did in August
last year to have a proper mender package running on buildroot.

Here you can find a list of threads referring to the last outstanding
problems:

https://patchwork.ozlabs.org/patch/959695/
https://patchwork.ozlabs.org/patch/959705/
https://patchwork.ozlabs.org/patch/959700/
https://patchwork.ozlabs.org/patch/959703/

Angelo Compagnucci (5):
  package/mender: adding a writable location
  package/mender: adding systemv init file
  package/mender: adding artifact_info file
  package/mender: adding device_type file
  package/mender: adding a readme file

 package/mender/S42mender      | 56 +++++++++++++++++++++++++++++++++++++++++++
 package/mender/artifact_info  |  1 +
 package/mender/device_type    |  1 +
 package/mender/mender.mk      | 13 ++++++++++
 package/mender/mender.service | 12 +++++++++-
 package/mender/readme.txt     | 18 ++++++++++++++
 6 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 package/mender/S42mender
 create mode 100644 package/mender/artifact_info
 create mode 100644 package/mender/device_type
 create mode 100644 package/mender/readme.txt

-- 
2.7.4
