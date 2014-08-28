From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 00:17:36 +0200
Subject: [Buildroot] [PATCH 0/3] Misc Ruby updates
Message-ID: <1409264259-13058-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are three patches for the Ruby package. The first two patches are
fixes and could be applied to the master branch. The last patch is a
bump of Ruby to the latest stable version, which could be applied to
the next branch.

Thanks,

Thomas

Thomas Petazzoni (3):
  ruby: requires shared library
  ruby: should not use dl_iterate_phdr() on Blackfin
  ruby: bump to version 2.1.2

 package/ruby/Config.in |  6 ++++--
 package/ruby/ruby.mk   | 13 ++++++++-----
 2 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.0.0
