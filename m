From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Oct 2013 17:40:40 +0200
Subject: [Buildroot] [PATCHv2] beaglebone: add BeagleBone Black support
In-Reply-To: <A20C6CC8-715F-45C3-BB9F-5085269FFD13@ti.com> (Jason Kridner's
 message of "Fri, 4 Oct 2013 15:36:35 +0000")
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <1380337717-19697-1-git-send-email-jkridner@beagleboard.org>
 <1380522195.4232.2.camel@viko> <87fvshjbnd.fsf@dell.be.48ers.dk>
 <A20C6CC8-715F-45C3-BB9F-5085269FFD13@ti.com>
Message-ID: <878uy9jb7r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Kridner, Jason <jdk@ti.com> writes:

Hi,

 >> I don't seem to have received the original here (probably because of my
 >> mail problems), but what's the reason for the ext2 -> initramfs changes?

 Jason> Just enabling rapid testing. This can boot off of a FAT
 Jason> formatted SD card, over USB, over serial or over Ethernet
 Jason> without passing a separate ramdisk. The ext2 required a separate
 Jason> download or special formatting of the card and wasted memory if
 Jason> used as a ramdisk.  Nothing too special here, but it simplifies
 Jason> use as a recovery system, validation system or bootloader.

Ok.

 Jason> I will keep it however you'd like. The important part is the kernel. 

I would like to keep it with ext2 just to keep it similar to the other
defconfigs. Then we also don't need to carry the u-boot patch.

Care to send a v3? Thanks.

-- 
Bye, Peter Korsgaard
