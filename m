From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 30 Jan 2021 22:40:24 +0100
Subject: [Buildroot] [PATCH 0/4] version bump of netopeer2 and related
 dependencies
Message-ID: <20210130214028.26398-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the bump of netopeer2 the bump of the dependencies is required:

From the releae summary [1]: "This release depends on libyang (v1.0.215),
libnetconf2 (v1.1.36) and sysrepo (v1.4.104)."

[1] https://github.com/CESNET/netopeer2/releases/tag/v1.1.53

Heiko Thiery (4):
  package/libyang: bump to version 1.0.215
  package/libnetconf2: bump version to 1.1.36
  package/sysrepo: bump version to 1.4.104
  package/netopeer2: bump version to 1.1.53

 package/libnetconf2/libnetconf2.hash          |  2 +-
 package/libnetconf2/libnetconf2.mk            |  2 +-
 package/libyang/libyang.hash                  |  2 +-
 package/libyang/libyang.mk                    |  2 +-
 ...support-using-current-user-for-SR-mo.patch | 93 -------------------
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                |  2 +-
 package/sysrepo/sysrepo.hash                  |  2 +-
 package/sysrepo/sysrepo.mk                    |  2 +-
 9 files changed, 8 insertions(+), 101 deletions(-)
 delete mode 100644 package/netopeer2/0001-scripts-FEATURE-support-using-current-user-for-SR-mo.patch

-- 
2.20.1
