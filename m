From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 09:27:02 +0100
Subject: [Buildroot] [pull request] Pull request for branch zlib-no-ldconfig
Message-ID: <cover.1296030417.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 4c6a451ac9fab16abcda5834ed4a9b728091ab9e:
  Thomas Petazzoni (1):
        tcpdump, libpcap: simplify and fix ac_cv_linux_vers

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot zlib-no-ldconfig

Thomas Petazzoni (1):
      zlib: disable call to ldconfig

 package/zlib/zlib.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

Thanks,
-- 
Thomas Petazzoni
