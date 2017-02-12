From: Anatoly Asviyan <aanatoly@gmail.com>
Date: Sun, 12 Feb 2017 14:46:57 +0200
Subject: [Buildroot] porting old build system to the buildroot
Message-ID: <CAPTQzAB=Gk7qrnaRbTbujQXKUbiF4Srgi7+8UibP4cAiN=AVCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
I am porting old build system to the buildroot. How do I express
"-mthumb -march=armv7-a -mcpu=cortex-a8 -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -DARM_NEON"
as a buildroot's config?

Toolchains is CodeSourcery/arm-2009q1  arm-none-linux-gnueabi gcc 4.3.3

I've set correct values (I hope they are) in "Target options" menu, but
still see gcc invocations without those flags.

-- 
Regards, Anatoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170212/21e7544c/attachment.html>
