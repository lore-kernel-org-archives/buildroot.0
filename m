From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  2 Feb 2012 23:29:24 +0100
Subject: [Buildroot] [pull request] Pull request for branch for-2012.02/misc
Message-ID: <cover.1328221763.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 8c3e2cbb53b0383f5b273a0a0c908b8b232d1072:

  Introduce /run directory (2012-02-02 23:03:13 +0100)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2012.02/misc

Thomas Petazzoni (2):
      poco: the Zip module depends on XML, Net and Util modules
      at91bootstrap: allow specification of a custom patch directory

 boot/at91bootstrap/Config.in        |    9 +++++++++
 boot/at91bootstrap/at91bootstrap.mk |    9 +++++++++
 package/poco/Config.in              |    3 +++
 3 files changed, 21 insertions(+), 0 deletions(-)

Thanks,
-- 
Thomas Petazzoni
