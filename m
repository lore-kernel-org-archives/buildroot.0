From: Matthew Urry <matthew.j.urry@gmail.com>
Date: Mon, 23 Dec 2013 11:30:49 +0000
Subject: [Buildroot] [PATCH 0/1] chdkptp cli
Message-ID: <1387798250-2437-1-git-send-email-matthew.j.urry@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the chdkptp program to buildroot. This program is
used to interact with Canon cameras over usb that have had their 
firmware hacked. It enables things like remote tethering via usb. 
I have only enabled the command line interface and not the GUI.

http://chdk.wikia.com/wiki/CHDK
https://www.assembla.com/spaces/chdkptp/wiki



Matthew Urry (1):
  chdkptp CLI added

 package/Config.in                                  |    1 +
 package/chdkptp/Config.in                          |   15 +++++++++++
 .../chdkptp-01-add_lm_flag_to_makefile.patch       |   15 +++++++++++
 ...ptp-02-create_sh_script_to_launch_chdkptp.patch |   22 ++++++++++++++++
 package/chdkptp/chdkptp.mk                         |   27 ++++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 package/chdkptp/Config.in
 create mode 100644 package/chdkptp/chdkptp-01-add_lm_flag_to_makefile.patch
 create mode 100644 package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch
 create mode 100644 package/chdkptp/chdkptp.mk

-- 
1.7.10.4
