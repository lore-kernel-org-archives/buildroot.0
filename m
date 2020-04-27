From: Shyam Saini <mayhs11saini@gmail.com>
Date: Mon, 27 Apr 2020 13:35:24 +0530
Subject: [Buildroot] [V2 PATCH 0/1] cukinia: new package
Message-ID: <20200427080525.617-1-shyam.saini@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After an initial proposal[1] to include Cukinia back in 2017, the
project has since gained in versatility and established a growing user
base.

Following Angelo Compagnucci's call[2] earlier on the mailing list,
here is a second and updated submission.

 [1] https://patchwork.ozlabs.org/project/buildroot/patch/20170425135814.8787-1-alexandre.leblanc at savoirfairelinux.com/
 [2] http://lists.busybox.net/pipermail/buildroot/2020-April/281338.html

Changelog:
V1->V2
 - It is not recommended to run it at boot time so remove init SZZcukinia script
   file and, remove BR2_PACKAGE_CUKINIA_BOOT option and all related configs 
 - Extend cukinia.conf file to include more example use cases.
 - Add cukinia.hash file and likewise add CUKINIA_LICENSE_FILES option.

Shyam Saini (1):
  cukinia: new package

 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/cukinia/Config.in    | 15 +++++++++++++++
 package/cukinia/cukinia.conf | 36 ++++++++++++++++++++++++++++++++++++
 package/cukinia/cukinia.hash |  4 ++++
 package/cukinia/cukinia.mk   | 20 ++++++++++++++++++++
 6 files changed, 79 insertions(+)
 create mode 100644 package/cukinia/Config.in
 create mode 100644 package/cukinia/cukinia.conf
 create mode 100644 package/cukinia/cukinia.hash
 create mode 100644 package/cukinia/cukinia.mk

-- 
2.20.1
