From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Dec 2011 11:28:36 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.02/ethercat
Message-ID: <cover.1324722512.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit ef3fe1bef6581c66af3858d540343e011cb9fdd6:

  cdrkit: bump to version 1.1.11 and adjust style (2011-12-21 23:02:31 +0100)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2012.02/ethercat

Thomas Petazzoni (1):
      igh-ethercat: new package

 package/Config.in                    |    1 +
 package/igh-ethercat/Config.in       |   23 +++++++++++++++++++
 package/igh-ethercat/igh-ethercat.mk |   41 ++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 package/igh-ethercat/Config.in
 create mode 100644 package/igh-ethercat/igh-ethercat.mk

Thanks,
-- 
Thomas Petazzoni
