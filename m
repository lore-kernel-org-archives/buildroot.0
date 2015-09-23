From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 24 Sep 2015 11:43:48 +1200
Subject: [Buildroot] [PATCHv3 0/3] micropython build fixes
Message-ID: <1443051831-8292-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first 2 patches are unchanged from the ones sent individually to the
list, the third is new and includes upstream fixes that we were already
carrying as patches.

Chris Packham (3):
  micropython: Invert fallback detection logic
  micropython: Disable for Blackfin
  micropython: Bump version to v1.4.6

 package/micropython/Config.in      | 3 +++
 package/micropython/micropython.mk | 7 ++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.5.0
