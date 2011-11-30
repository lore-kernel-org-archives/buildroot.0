From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2011 23:19:07 +0100
Subject: [Buildroot] [pull request] Pull request for branch ethercat
Message-ID: <cover.1322691543.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 47c46ea1fc4a4c18be830f9092a8b9d8b3feda38:

  linux: update stable kernel to 3.1.4 (2011-11-29 09:18:30 +0100)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git ethercat

Thomas Petazzoni (1):
      igh-ethercat: new package

 package/Config.in                    |    1 +
 package/igh-ethercat/Config.in       |   23 +++++++++++++++++++++++
 package/igh-ethercat/igh-ethercat.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 package/igh-ethercat/Config.in
 create mode 100644 package/igh-ethercat/igh-ethercat.mk

Thanks,
-- 
Thomas Petazzoni
