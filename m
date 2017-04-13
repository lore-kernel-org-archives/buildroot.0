From: =?UTF-8?Q?St=c3=a9phane_Jublin?= <stephane.jublin@gmail.com>
Date: Thu, 13 Apr 2017 12:29:21 +0200
Subject: [Buildroot] Journal size too big for filesystem
Message-ID: <fa03666f-27d6-d01b-078a-7da8900e9eb6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

thank's for Buildroot.
I just beging to learn , understand and test it.
I've got the last version of buildroot (git pull in my git directory)

I just try to build an image.
1) make pc_x86_64_bios_defconfig
2) make

at the end of the compilation I have this error


*tune2fs 1.43.4 (31-Jan-2017)**
**tune2fs 1.43.4 (31-Jan-2017)**
****
**Please run e2fsck on the filesystem.**
****
**Creating journal inode:**
**Journal size too big for filesystem.**
****
**fs/ext2/ext2.mk:44 : Recipe for target 
? /home/***/git/buildroot/output/images/rootfs.ext2 ? failed**
**make[1]: *** [/home/***/git/buildroot/output/images/rootfs.ext2] 
Erreur 1**
**Makefile:79 : Recipe for target ? _all ? failed**
**make: *** [_all] Erreur 2*


I find this error on different web site, but no effect
https://github.com/buildroot/buildroot/commit/c6bca8cef0310bc649240b451989457ce94a8358
https://git.busybox.net/buildroot/commit/?id=0fab0a4afdff2f27fce49e7b38179e781e7b64ed
https://patchwork.ozlabs.org/patch/225977/

Could you help me ?

Thank's

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170413/4b9418ac/attachment.html>
