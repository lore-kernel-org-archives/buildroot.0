From: =?GBK?B?wO7Rp778?= <lixuejun@vip.163.com>
Date: Tue, 20 Nov 2018 17:24:17 +0800 (CST)
Subject: [Buildroot] buildroot error: No hash found for gcc-7.3.0.tar.xz
Message-ID: <2776276a.afc0d.167306f454d.Coremail.lixuejun@vip.163.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot developers

 

As a beginner, I?m looking for some advices on the issue : No hash found for gcc-7.3.0.tar.xz.

 My platform is ubantu 18.04(64 bit) on VirtualBox(X86), buildroot 2018.08. The .config file is attached.

The following is a copy of the log from running buildroot make command:

 

ERROR: No hash found for gcc-7.3.0.tar.xz

package/pkg-generic.mk:135: recipe for target '/home/lxj/buildroot-2018.08.2/output/build/host-gcc-initial-7.3.0/.stamp_downloaded' failed

make: *** [/home/lxj/buildroot-2018.08.2/output/build/host-gcc-initial-7.3.0/.stamp_downloaded] Error 1

root at lxj-VirtualBox:/home/lxj/buildroot-2018.08.2#

 

There is a file ?gcc-7.3.0.tar.xz? at path /home/lxj/buildroot-2018.08.2/dl/gcc, and its sha256sum is: 
ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19c19921b0cdf6d05483faede8287bb9ea120c0d1559449a70e602c8d4  gcc-7.3.0.tar.xz

 

There is a file ?gcc.hash? at path /home/lxj/buildroot-2018.08.2/package/gcc, include the foloowing lines:

# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.3.0/sha512.sum

sha512  ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19c19921b0cdf6d05483faede8287bb9ea120c0d1559449a70e602c8d4  gcc-7.3.0.tar.xz

 

Thank you for your consideration in advance.

 Xuejun Li






--

??VIP????????????????????????????????????????????????????????????????????????
Alert message of Netease Vipmail?Never provide your password, security questions, verification codes, or any other personal important information details to anyone else.
You can identify mail message by telephone,video-chat or other ways.You should make sure that your email address, bank account and other confidential information as secure as possible. Thank you for keeping your email account secure.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181120/66a4a60d/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 88103 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181120/66a4a60d/attachment-0001.obj>
