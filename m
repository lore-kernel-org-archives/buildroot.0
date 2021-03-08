From: Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  8 Mar 2021 14:27:39 +0100
Subject: [Buildroot] [PATCH 0/2] package/sysklogd: adopt and bump to version
 2.2.2
Message-ID: <20210308132742.4022471-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this bump of sysklogd fixes a rather ugly bug in parsing the timestamp
of kernel log messages.  The regression comes from moving from the old
/proc/kmsg interface to the modern /dev/kmsg dito.  So Peter might be
interested in cherry-picking this to 2021.02.x

Best regards
 /Joachim

Joachim Wiberg (2):
  package/sysklogd: bump to version 2.2.2
  DEVELOPERS: adopt package/sysklogd

 DEVELOPERS                     | 1 +
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.25.1
