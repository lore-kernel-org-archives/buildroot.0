From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 31 Jul 2016 14:43:09 +0900
Subject: [Buildroot] [PATCH 0/2] zynq: some fixes and update readme.txt for
	custom ps7_init guide
Message-ID: <1469943791-4805-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Matthew Weber reviewed v1 of my Zynq update series, and mentioned
to add information about custom ps7_init files.

So, I was working on v2 and was almost about to send v2.
But I was a few hours late...  V1 is now in the mailine.

So, I am sending a follow-up series.

1/2 is a fix I was planning to squash into v1.

2/2 is a readme update to revive custom ps7_init information.
(Matt said he would send it, but I had already prepared it,
so here it is just in case.  If he would like to replace it
with a better one, that is fine, though.)



Masahiro Yamada (2):
  zynq: enable BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
  zynq: document how to use custom ps7_init files

 board/zynq/readme.txt           | 46 ++++++++++++++++++++++++++++++++++-------
 configs/zynq_microzed_defconfig |  3 ++-
 configs/zynq_zc706_defconfig    |  5 +++--
 configs/zynq_zed_defconfig      |  3 ++-
 4 files changed, 45 insertions(+), 12 deletions(-)

-- 
1.9.1
