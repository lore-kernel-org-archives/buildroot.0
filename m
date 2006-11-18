From: Ulf Samuelsson <ulfs@dof.se>
Date: Sun, 19 Nov 2006 00:50:57 +0100
Subject: [Buildroot] JFFS2 on Dataflash
Message-ID: <011b01c70b6d$0cc1b270$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to create a JFFS2 file system on a dataflash.

Seems to boot, but I get a lot of output when I boot.

"CLEANMARKER node fouind at <address> has totlen 0xc !
Google tells me that CLEANMARKERs are stored out of band in NAND flash due to 
the extra bytes and "-n" should be used for mkfs.jffs2.

I use the
mkfs.jffs2 -e 0x2100 -s 0x420 -p -l -n -d <myroot> -o <my-file-system>

Anyoone knows if this is the correct way to build the JFFS2 filesystem for dataflash?


Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061119/a6a18d91/attachment.html 
