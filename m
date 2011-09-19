From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 23:42:56 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/cifs-utils
Message-ID: <cover.1316468572.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit dcb43a0eb0c09ffb84c6c7b4c169a2874cb24cc9:

  barebox: patch-kernel.sh is no more (2011-09-19 10:13:37 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/cifs-utils

Thomas Petazzoni (1):
      cifs-utils: new package

 package/Config.in                |    1 +
 package/cifs-utils/Config.in     |   13 +++++++++++++
 package/cifs-utils/cifs-utils.mk |    5 +++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/cifs-utils/Config.in
 create mode 100644 package/cifs-utils/cifs-utils.mk

Thanks,
-- 
Thomas Petazzoni
