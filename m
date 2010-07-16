From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jul 2010 23:45:41 +0200
Subject: [Buildroot] [pull request] Pull request for branch linux-fusion-fix
Message-ID: <cover.1279316732.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit a67a62c296103f50bff9f9e6bcfb90def2b8d62e:
  Sagaert Johan (1):
        qt: fix javscriptcore/multimedia build with uClibc

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot linux-fusion-fix

Thomas Petazzoni (2):
      linux-fusion: use install target instead of headers_install
      linux-fusion: many fixes

 package/directfb/Config.in                         |    2 +-
 package/linux-fusion/Config.in                     |    2 +-
 .../linux-fusion-8.1.1-missing-include.patch       |   17 ++++++++
 package/linux-fusion/linux-fusion.mk               |   43 ++++++-------------
 4 files changed, 33 insertions(+), 31 deletions(-)
 create mode 100644 package/linux-fusion/linux-fusion-8.1.1-missing-include.patch

Thanks,
-- 
Thomas Petazzoni
