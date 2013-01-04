From: Gary Coulbourne <bear@bears.org>
Date: Fri,  4 Jan 2013 16:41:17 -0500
Subject: [Buildroot] [PATCH] update to earlier patch to support multiple
	device trees in /boot
Message-ID: <1357335678-5915-1-git-send-email-bear@bears.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I submitted a patch earlier for copying device files into /boot, this adds support for multiple device trees.

Gary Coulbourne (1):
  modifications of original patch to copy device trees into the boot
    directory.  This now supports multiple device trees.

 linux/Config.in |    6 ++++++
 linux/linux.mk  |   10 ++++++++++
 2 files changed, 16 insertions(+)

-- 
1.7.10.4
