From: Markus Mayer <code@mmayer.net>
Date: Tue, 31 Oct 2017 15:36:57 -0700
Subject: [Buildroot] [PATCH 0/2] dhcpcd: start-up scripts
Message-ID: <20171031223659.6831-1-code@mmayer.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markus Mayer <mmayer@broadcom.com>

System V and systemd start-up scripts for dhcpcd.

Other daemons come with start-up scripts, whereas dhcpcd did not
include them.

Markus Mayer (2):
  dhcpcd: add SysV start-up script
  dhcpcd: add systemd start-up service

 package/dhcpcd/S41dhcpcd      | 34 ++++++++++++++++++++++++++++++++++
 package/dhcpcd/dhcpcd.mk      | 13 +++++++++++++
 package/dhcpcd/dhcpcd.service | 13 +++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100755 package/dhcpcd/S41dhcpcd
 create mode 100644 package/dhcpcd/dhcpcd.service

-- 
2.7.4
