From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sat, 15 Jun 2013 10:23:21 +0200
Subject: [Buildroot] [PATCH] toolchain/crostool-NG: mark as deprecated
In-Reply-To: <20130614225556.GA3417@free.fr>
References: <CADXR8ejLiDw3ZDR3iBRfYKBqqJ5abS5OSV=cGqXChxKvsPHioA@mail.gmail.com>
 <20130614225556.GA3417@free.fr>
Message-ID: <51BC2479.2060500@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 15.06.2013 00:55, schrieb Yann E. MORIN:
> Soochaon, All,
> 
> On 2013-06-14 16:24 -0400, soochon radee spake thusly:
>> I know I'm chiming in late here, but I actively use ctng to build an eglibc
>> toolchain within buildroot. I hope that you can retain it until Thomas's
>> successor is in and running.
> 
> I understand your, and other's, concern, and that's why the support for
> the ct-ng backend was not removed, and only marked deprecated.

In the first I was also a little bit unhappy with this advertising of
deprecation for crosstool-NG support inside buildroot. But in the end it
is really much easier to include a external toolchain into buildroot
then keep the crosstool-NG backend running. And, as Yann wrote, it saves
a lot of time while collecting things. :-)

I pushed my current used ARM1176 Toolchain config to github and wrote
(mostly for me) some lines how to use.
https://github.com/tijuca/ct-ng/blob/arm/howto-build.README

The resulting archive can be used as external toolchain inside buildroot
(as local file or via http URL).

Regards
Carsten
