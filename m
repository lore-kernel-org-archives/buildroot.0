From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  6 Mar 2020 13:42:22 +0100
Subject: [Buildroot] [PATCH v2 0/1] package/linuxptp: make initscript
 options configurable
Message-ID: <20200306124222.28208-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After talking to Michael I've taken his patch and did a new version
with some modifications/improvements.

---
v1 -> v2
 - rename the init script from S65linuxptp to S65ptp4l
 - move the phc2sys stuff to S66phc2sys
 - use the style form package/busybox/S01syslogd as template

Heiko Thiery (1):
  package/linuxptp: make initscript options configurable

 package/linuxptp/S65linuxptp | 46 ----------------------------
 package/linuxptp/S65ptp4l    | 59 ++++++++++++++++++++++++++++++++++++
 package/linuxptp/S66phc2sys  | 59 ++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 46 deletions(-)
 delete mode 100644 package/linuxptp/S65linuxptp
 create mode 100644 package/linuxptp/S65ptp4l
 create mode 100644 package/linuxptp/S66phc2sys

-- 
2.20.1
