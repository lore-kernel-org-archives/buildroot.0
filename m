From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2009 16:15:36 +0200
Subject: [Buildroot] [pull request] Pull request for branch snmp-fix
Message-ID: <cover.1249395336.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 5b72dda69f72e1953dfc7987dd1b418e1afe79a4:
  Peter Korsgaard (1):
        buildroot: fix fallout after qtopia4 -> qt rename

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot snmp-fix

Thomas Petazzoni (3):
      netsnmp: convert to autotools.in and fix build issues
      netsnmp: update TODO
      netsnmp: add patch to fix CVE-2008-6123

 TODO                                               |   10 +
 .../netsnmp/netsnmp-5.4.2.1-CVE-2008-6123.patch    |   29 +++
 .../netsnmp-5.4.2.1-build-system-fixup.patch       |   29 +++
 package/netsnmp/netsnmp.mk                         |  179 ++++++--------------
 4 files changed, 119 insertions(+), 128 deletions(-)
 create mode 100644 package/netsnmp/netsnmp-5.4.2.1-CVE-2008-6123.patch
 create mode 100644 package/netsnmp/netsnmp-5.4.2.1-build-system-fixup.patch

Thanks,
-- 
Thomas Petazzoni
