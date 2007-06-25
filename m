From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Mon, 25 Jun 2007 11:27:47 +0200
Subject: [Buildroot] Make the top rule %_defconfig work
Message-ID: <1182763667.10703.21.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please see the included patch as a comment to the earlier discussion
about having _defconfig. By only searching the target/ directory it will
not conflict with the extracted kernel and similar.

It makes the most sense to be able to load a BR2 <board>_defconfig from
the target directory. What this build target does is to overwrite
the .config with a premade default configuration.

For example as a hardware (and software) provider I would like to be
able to build a "standard" image having a collection of applications
useful for the board.

-- 
Mvh
Hans-Christian Egtvedt
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Search-for-defconfigs-in-target-not-entire-tree.txt
Type: application/mbox
Size: 0 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070625/f14863a8/attachment.bin 
