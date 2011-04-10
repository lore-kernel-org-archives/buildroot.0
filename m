From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 9 Apr 2011 18:39:43 -0700
Subject: [Buildroot] External Toolchain
Message-ID: <BANLkTi=oiuoXSmHC7G+AtU_+t47D3Ajk2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to understand the use of an external toolchain in buildroot.

I have the latest CodeSourcery toolchain. This is the one from
http://www.codesourcery.com/sgpp/lite/power/portal/release1571 which is gcc
4.5.1.

I am trying to integrate it into buildroot sufficiently to build just root
filesystems for my project.

I have it in my path and it is "powerpc-linux-gnu-" and installed it in its
default location which is "/root/CodeSourcery/Sourcery_G++_Lite/bin/".

Next, I changed External Toolchain path from "/path/to/staging_dir/usr" to
"/root/CodeSourcery/Sourcery_G++_Lite/" and "External toolchain prefix from
"$(ARCH)-linux" to "powerpc-linux-gnu" and when running a make with the
uclibc option selected I get "Checking external toolchain settings,
Incorrect selection of the C library". When I select "glibc" instead, I just
get an "Error 1" from make and no additional information.

I would like to use a CodeSourcery binary and I would like to compile both
glibc and uclibc root filesystems.

Could I ask for a little help understanding what is going on, please?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110409/f49f3d19/attachment.html>
