From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2011 13:56:07 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/no-fakeroot-on-target
Message-ID: <cover.1306065364.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit a02cfbf1f4a82ee6582e2bf7622b2bf105359ea9:

  bind: give path to OpenSSL when OpenSSL is enabled (2011-05-19 20:03:35 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.05/no-fakeroot-on-target

Thomas Petazzoni (1):
      fakeroot: disallow selection for the target

 package/Config.in            |    1 -
 package/fakeroot/Config.in   |    6 ------
 package/fakeroot/fakeroot.mk |    3 +++
 3 files changed, 3 insertions(+), 7 deletions(-)
 delete mode 100644 package/fakeroot/Config.in

Thanks,
-- 
Thomas Petazzoni
