From: Conny Marco =?ISO-8859-1?Q?Menebr=F6cker?= <menebroecker@web.de>
Date: Tue, 13 May 2008 18:17:41 +0200
Subject: [Buildroot] How to add a new package?
Message-ID: <1210695461.3289.16.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried to add a new package. Like discribed at
http://buildroot.uclibc.org/buildroot.html i created a Config.in and
package.mk. If I add a line in buildroot/.config and type 'make', the
package will be add to my created root filesystem.

But how can I add the package that I can activate the software with
'make menuconfig' ?
At a page that I found by google, I raed that I have to add my Config.in
at buildroot/package/Config.in. But after 'make menuconfig' there isn't
an entry for my new software.

What have I to do, to get an entry in menuconfig for my software?

Conny
-- 
Don't send me an personal e-mail since it will be filtered by my
spamfilter.
