From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 14 Apr 2020 10:17:14 +0200
Subject: [Buildroot] [PATCH 0/3] bump sysrepo and dependencies
Message-ID: <20200414081717.4940-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset updates the following packages:
- sysrepo to 1.4.2
- libyang to 1.0.130
- libnetconf2 to 1.4.2

These packages has to be updated together due to the dependencies.

Heiko Thiery (3):
  package/libnetconf2: bump to version 1.1.7
  package/libyang: bump to version 1.0.130
  package/sysrepo: bump to version 1.4.2

 package/libnetconf2/libnetconf2.hash          |  5 +-
 package/libnetconf2/libnetconf2.mk            |  2 +-
 package/libyang/libyang.hash                  |  5 +-
 package/libyang/libyang.mk                    |  2 +-
 ...CHANGE-create-plugins-dir-if-it-does.patch | 41 ------------
 ...BUGFIX-create-plugins-dir-recursivel.patch | 65 -------------------
 package/sysrepo/sysrepo.hash                  |  5 +-
 package/sysrepo/sysrepo.mk                    |  2 +-
 8 files changed, 12 insertions(+), 115 deletions(-)
 delete mode 100644 package/sysrepo/0001-sysrepo-plugind-CHANGE-create-plugins-dir-if-it-does.patch
 delete mode 100644 package/sysrepo/0002-sysrpeo-plugind-BUGFIX-create-plugins-dir-recursivel.patch

-- 
2.20.1
