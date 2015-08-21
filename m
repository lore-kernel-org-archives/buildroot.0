From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Fri, 21 Aug 2015 18:45:11 +0200
Subject: [Buildroot] [PATCH v2 0/8] package/dhcp: rework the SysV init
	scripts
Message-ID: <1440175519-478-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This v2 only appends new patches to the series.

Best regards,
Beno?t

Beno?t Th?baudeau (8):
  package/dhcp: fix SysV init scripts option passing
  package/dhcp/S80dhcp-server: support extra options
  package/dhcp/S80dhcp-server: allow empty INTERFACES
  package/dhcp: fix SysV init scripts output text
  package/dhcp: remove sleep from SysV init scripts restart
  package/dhcp: SysV init scripts: remove PID files after stop
  package/dhcp/S80dhcp-server: support IPv6 lease file
  package/dhcp: SysV init scripts: refactor using functions

 package/dhcp/S80dhcp-relay  | 64 ++++++++++++++++++++++++--------------
 package/dhcp/S80dhcp-server | 76 +++++++++++++++++++++++++++++----------------
 2 files changed, 91 insertions(+), 49 deletions(-)

-- 
2.1.4
