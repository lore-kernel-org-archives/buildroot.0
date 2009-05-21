From: George Matveev <geomat@europe.com>
Date: Thu, 21 May 2009 19:14:06 +0000
Subject: [Buildroot] unrecognized option `-Qy'
Message-ID: <20090521191406.5EA6ABE407E@ws1-9.us4.outblaze.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

buildroot-2009.02.tar.bz2 returns this:

/home/work/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-as: 
unrecognized option `-Qy'
make[2]: *** [build/genmodes.o] Error 1
make[2]: Leaving directory 
`/home/work/buildroot/toolchain_build_arm/gcc-4.3.2-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory 
`/home/work/buildroot/toolchain_build_arm/gcc-4.3.2-initial'
make: *** 
[/home/work/buildroot/toolchain_build_arm/gcc-4.3.2-initial/.compiled] Error 
2
geomat at fermat:/home/work/buildroot$

when building for arm920t.

Attached are log-make-arm920t.txt and .config used.

Have already seen this:
http://lists.busybox.net/pipermail/buildroot/2009-January/025418.html

Any PRACTICAL solution would be appreciated.

Best regards,
George


-- 
Be Yourself @ mail.com!
Choose From 200+ Email Addresses
Get a Free Account at www.mail.com

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: log-make-arm920t.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090521/8d183704/attachment-0001.txt>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: used.config
Type: application/octet-stream
Size: 18264 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090521/8d183704/attachment-0001.obj>
