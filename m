From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 10 Jun 2015 11:20:47 +0530
Subject: [Buildroot] [PATCH v2 0/2] new packages gflags and glog
Message-ID: <1433915449-15994-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set adds two new packages gflags and glog.

Changes v1 -> v2:
	PATCH 1/2 - correct check for toolchain doesn't support threads (suggested by Thomas Petazzoni)
	PATCH 2/2 - no change

Rahul Bedarkar (2):
  gflags: new package
  glog: new package

 package/Config.in          |  2 ++
 package/gflags/Config.in   | 13 +++++++++++++
 package/gflags/gflags.hash |  2 ++
 package/gflags/gflags.mk   | 17 +++++++++++++++++
 package/glog/Config.in     | 11 +++++++++++
 package/glog/glog.hash     |  2 ++
 package/glog/glog.mk       | 17 +++++++++++++++++
 7 files changed, 64 insertions(+)
 create mode 100644 package/gflags/Config.in
 create mode 100644 package/gflags/gflags.hash
 create mode 100644 package/gflags/gflags.mk
 create mode 100644 package/glog/Config.in
 create mode 100644 package/glog/glog.hash
 create mode 100644 package/glog/glog.mk

-- 
1.9.1
