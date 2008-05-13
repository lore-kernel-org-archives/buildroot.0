From: hartleys <hartleys@visionengravers.com>
Date: Tue, 13 May 2008 13:30:32 -0400
Subject: [Buildroot] How to add a new package?
In-Reply-To: <1210695461.3289.16.camel@localhost>
References: <1210695461.3289.16.camel@localhost>
Message-ID: <1CF6EDDF0820924DA43C9A52FE7325950B6CA51E@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In package/Config.in add a:

source "package/your_package/Config.in"
Replace "your_package" with the directory name of your added package

Somewhere that makes sense for the package you are adding.

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Conny Marco Menebr?cker
Sent: Tuesday, May 13, 2008 9:18 AM
To: buildroot at uclibc.org
Subject: [Buildroot] How to add a new package?

Hi,

I tried to add a new package. Like discribed at http://buildroot.uclibc.org/buildroot.html i created a Config.in and package.mk. If I add a line in buildroot/.config and type 'make', the package will be add to my created root filesystem.

But how can I add the package that I can activate the software with 'make menuconfig' ?
At a page that I found by google, I raed that I have to add my Config.in at buildroot/package/Config.in. But after 'make menuconfig' there isn't an entry for my new software.

What have I to do, to get an entry in menuconfig for my software?

Conny
--
Don't send me an personal e-mail since it will be filtered by my spamfilter.

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
