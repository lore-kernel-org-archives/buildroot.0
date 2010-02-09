From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Feb 2010 00:46:05 +0100
Subject: [Buildroot] [pull request] Pull request for branch fixes
Message-ID: <cover.1265759162.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit f0bdacdb5b8fe0fbc276ed510fc58e9a219f5cf8:
  Peter Korsgaard (1):
        update for 2010.02-rc1

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot fixes

Thomas Petazzoni (3):
      Create $(STAGING_DIR)/usr/bin unconditionnally
      argus: fix compile breakage
      at: fix compile breakage when flex isn't on the target

 Makefile                                           |    1 +
 .../argus-3.0.0.rc.34-01-use-pcap-header.patch     |   27 ++++++++++++++++++++
 package/at/at-3.1.12-0007-include-config-h.patch   |   16 +++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 package/argus/argus-3.0.0.rc.34-01-use-pcap-header.patch
 create mode 100644 package/at/at-3.1.12-0007-include-config-h.patch

Thanks,
-- 
Thomas Petazzoni
