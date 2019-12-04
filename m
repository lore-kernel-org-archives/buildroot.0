From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 4 Dec 2019 11:41:44 +0100
Subject: [Buildroot] [PATCH 0/7] Improve sysrepo support
Message-ID: <cover.1575456104.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series synces up current Buildroot support (thanks for
submitting it, Heiko) with what I have been using for 2+ years. I still
have a few pending patches for Netopeer2 in my queue, please expect them
later this week.

Jan Kundr?t (7):
  libyang: Optional C++ bindings
  sysrepo: fix a typo when installing with systemd
  sysrepo: libnetconf2 is not needed
  sysrepo: Optional support for C++ bindings
  sysrepo: Use a common repository location
  libnetconf2: adjust dependencies
  Add me as a maintainer for the NETCONF stack

 DEVELOPERS                    |  3 +++
 package/libnetconf2/Config.in |  4 ++++
 package/libyang/Config.in     | 10 ++++++++++
 package/libyang/libyang.mk    |  7 +++++++
 package/sysrepo/Config.in     |  7 ++++++-
 package/sysrepo/sysrepo.mk    | 22 ++++++++++++++++++----
 6 files changed, 48 insertions(+), 5 deletions(-)

-- 
2.21.0
