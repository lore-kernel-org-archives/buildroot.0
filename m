From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 17:46:55 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/mail-packages
Message-ID: <cover.1334677614.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 2f41adabc5a12fcca1de5b6c296c2206b518abff:

  New package: libdmtx (2012-04-17 00:21:39 +0200)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/mail-packages

Thomas Petazzoni (2):
      heirloom-mailx: new package
      msmtp: new package

 package/Config.in                        |    2 ++
 package/heirloom-mailx/Config.in         |   13 +++++++++++++
 package/heirloom-mailx/heirloom-mailx.mk |   28 ++++++++++++++++++++++++++++
 package/msmtp/Config.in                  |   10 ++++++++++
 package/msmtp/msmtp.mk                   |   28 ++++++++++++++++++++++++++++
 5 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 package/heirloom-mailx/Config.in
 create mode 100644 package/heirloom-mailx/heirloom-mailx.mk
 create mode 100644 package/msmtp/Config.in
 create mode 100644 package/msmtp/msmtp.mk

Thanks,
-- 
Thomas Petazzoni
