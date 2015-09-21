From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 21 Sep 2015 18:29:42 +0200
Subject: [Buildroot] [PATCH 0/2] Early boot fixes
Message-ID: <1442852984-28452-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

my mdev-without-devtmpfs highlighted a couple errors that are not strictly
related to that work. And since that work might or not have a v2, and is
not very likely to be merged at all, let's have the two small fixes rolling
on their own.

Enjoy!

Luca Ceresoli (2):
  busybox: inittab: don't redirect output to /dev/null
  skeleton: fix absence of /dev/shm on static, read-only systems

 package/busybox/inittab        | 12 ++++++------
 system/skeleton/dev/shm/.empty |  0
 2 files changed, 6 insertions(+), 6 deletions(-)
 create mode 100644 system/skeleton/dev/shm/.empty

-- 
1.9.1
