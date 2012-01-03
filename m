From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Jan 2012 21:48:45 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.02/xenomai-update
Message-ID: <cover.1325623724.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 5528286147492aafa8740c09db63290042b79cb0:

  rt-tests: fix build issues on uClibc (2012-01-03 09:15:17 +0100)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2012.02/xenomai-update

Thomas Petazzoni (3):
      xenomai: bump to 2.6.0
      xenomai: restrict to the set of supported architectures
      xenomai: mention which kernel versions are supported

 linux/Config.ext.in                         |    8 +++
 package/xenomai/Config.in                   |   62 +----------------------
 package/xenomai/xenomai-fix-lfs-issue.patch |   72 +++++++++++++++++++++++++++
 package/xenomai/xenomai.mk                  |   11 +----
 4 files changed, 83 insertions(+), 70 deletions(-)
 create mode 100644 package/xenomai/xenomai-fix-lfs-issue.patch

Thanks,
-- 
Thomas Petazzoni
