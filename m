From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 00:05:04 +0200
Subject: [Buildroot] [pull request] Pull request for branch libaio-conversion
Message-ID: <cover.1270764293.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 633049d80064e8c156ff58e1fc776f2f9afe9163:
  Gustavo Zacarias (1):
        Enable e300c2, e300c3 and e500mc powerpc optimizations

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot libaio-conversion

Thomas Petazzoni (1):
      libaio: convert to the GENTARGETS infrastructure

 package/libaio/libaio-0.3.109-arches.patch  |  671 +++++++++++++++++++++++++++
 package/libaio/libaio-0.3.109-destdir.patch |   24 +
 package/libaio/libaio.mk                    |   52 +--
 3 files changed, 708 insertions(+), 39 deletions(-)
 create mode 100644 package/libaio/libaio-0.3.109-arches.patch
 create mode 100644 package/libaio/libaio-0.3.109-destdir.patch

Thanks,
-- 
Thomas Petazzoni
