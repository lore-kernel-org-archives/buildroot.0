From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Tue, 16 Jun 2009 10:16:15 +0200
Subject: [Buildroot] VLC in older buildroot
Message-ID: <330EC2471BF24E48B513AF1A6975EB69A22CE3@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to get VLC compiled in a buildroot.  I'm currently using
buildroot 0.10.0-svn. I know, there are million reasons to upgrade to
newer, but right now I really don't have time to do it since things have
changed quite a lot.

 

Is it possible to get VLC compiled in that buildroot version? I was able
to compile it almost, with some tweaks to the buildroot and vlc, but now
I get error that I don't know how to solve it. I also don't know if this
is vlc problem or buildroot.

 

/<path-removed>/trunk/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc
/arm-linux-uclibc/4.2.3/../../../../arm-linux-uclibc/bin/ld: vlc: hidden
symbol `__udivsi3' in
/<path-removed>trunk/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/
arm-linux-uclibc/4.2.3/libgcc.a(_udivsi3.o) is referenced by DSO

/<path-removed>/trunk/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc
/arm-linux-uclibc/4.2.3/../../../../arm-linux-uclibc/bin/ld: final link
failed: Nonrepresentable section on output

 

Before that the system is looking for libraries like pthread, dl, m and
c. 

 

I looked from google, but couldn't quite figure out what is causing that
error.  Any idea what might be the problem? 

 

-TK

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090616/5fae8dd8/attachment.htm>
