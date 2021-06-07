From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 15:17:31 -0000
Subject: [Buildroot] [git commit] package/kodi-pvr-mediaportal-tvserver:
 bump version to 8.1.2
Message-ID: <20210607144651.37EFF8B398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1eaba3616c8d8a958e7162383865fb8337d1c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed all patches which were applied upstream:
https://github.com/kodi-pvr/pvr.mediaportal.tvserver/commits/Matrix

Changelog:
https://github.com/kodi-pvr/pvr.mediaportal.tvserver/blob/Matrix/pvr.mediaportal.tvserver/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ved-no-more-supported-C-17-declaration-ke.patch |  29 -
 .../0002-Remove-p8-os-includes.patch               | 157 -----
 .../0003-Use-kodi-StringUtils.patch                | 124 ----
 .../0004-Remove-SAFE_DELETE.patch                  | 289 ---------
 ...thread-sleep_for-instead-of-p8-time-utils.patch | 308 ----------
 ...ead-std-mutex-condition_variable-instead-.patch | 673 ---------------------
 .../0007-Remove-charset-converter-dependency.patch |  55 --
 .../0008-Remove-p8-platform-dependency.patch       |  74 ---
 .../0009-Travis-changes-for-cpp17.patch            |  28 -
 ...ister-keyword-as-no-longer-valid-in-CPP17.patch |  23 -
 .../0011-changelog-and-version-v8.1.1.patch        |  42 --
 .../kodi-pvr-mediaportal-tvserver.hash             |   2 +-
 .../kodi-pvr-mediaportal-tvserver.mk               |   2 +-
 13 files changed, 2 insertions(+), 1804 deletions(-)

Patch is too large, so refusing to show it
