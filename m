From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 May 2011 18:52:26 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/fix-ext-toolchain-support
Message-ID: <cover.1304873537.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit e46ba3c65bb76de30e6534a5552db7562c354d3a:
  Phil Edworthy (1):
        sh: Only use the CodeSourcery toolchain for SH4A devices

are available in the git repository at:

  http://free-electrons.com/~thomas/buildroot.git for-2011.05/fix-ext-toolchain-support

Thomas Petazzoni (1):
      external-toolchain: fix support

 toolchain/helpers.mk                     |   17 +++++++++++++----
 toolchain/toolchain-external/ext-tool.mk |    7 ++++---
 2 files changed, 17 insertions(+), 7 deletions(-)

Thanks,
-- 
Thomas Petazzoni
