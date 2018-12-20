From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 20 Dec 2018 00:31:58 -0200
Subject: [Buildroot] [PATCH v2 0/2] Add a sysctl init script
Message-ID: <20181220023200.17119-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In this second round we use a while loop to process the configuration
files and send the sysctl output to syslog.

Carlos Santos (2):
  package/procps-ng: add init script for sysctl
  package/busybox: add init script for sysctl

 package/busybox/S02sysctl      | 66 ++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk     | 12 +++++++
 package/procps-ng/S02sysctl    | 64 +++++++++++++++++++++++++++++++++
 package/procps-ng/procps-ng.mk |  5 +++
 4 files changed, 147 insertions(+)
 create mode 100644 package/busybox/S02sysctl
 create mode 100644 package/procps-ng/S02sysctl

-- 
2.19.2
