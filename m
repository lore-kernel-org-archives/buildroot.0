From: David GOUARIN <dgouarin@gmail.com>
Date: Mon, 21 Sep 2020 18:58:32 +0200
Subject: [Buildroot] [PATCH 0/2] Add RELP plugin to rsyslog
Message-ID: <20200921165834.7514-1-dgouarin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the form of an option in order not to draw too much dependencies for those who prefer to keep it lightweight.

David GOUARIN (2):
  packages/librelp: new package.
  packages/rsyslog: add support for RELP

 package/Config.in            |  1 +
 package/librelp/Config.in    | 10 ++++++++++
 package/librelp/librelp.hash |  6 ++++++
 package/librelp/librelp.mk   | 14 ++++++++++++++
 package/rsyslog/Config.in    |  7 +++++++
 package/rsyslog/rsyslog.mk   |  6 ++++++
 6 files changed, 44 insertions(+)
 create mode 100644 package/librelp/Config.in
 create mode 100644 package/librelp/librelp.hash
 create mode 100644 package/librelp/librelp.mk

-- 
2.17.1
