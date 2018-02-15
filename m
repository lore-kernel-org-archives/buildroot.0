From: Sjoerd Venema <srg.venema@gmail.com>
Date: Thu, 15 Feb 2018 18:48:17 +0100
Subject: [Buildroot] Can't build customized packages
Message-ID: <CAPzckP4HAA7mSPAr+vFgyjNihRhB805cbev_gxJAz4RCqK5Ezw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm probably missing something basic here, but I can't see it. Any way, I
have created a number of custom packages, which I have grouped under a
sub-directory of packages.

I have added a Config.in to that sub-directory ("packages/arctura"... see
link below), which makes everything selectable in the "make
menuconfig"-menu. So far, so good.

However, I noticed that the packages are not being build. And running make
<custom package> returns a "No rule to make target" error.

I hadn't added a <company>.mk makefile ("actura.mk", see link below) yet,
so I did, according to the documentation, but no difference.

My setup can be seen here:
https://github.com/Sjoerd82/buildroot/tree/master/buildroot-2017.08

Thanks

<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Virus-free.
www.avast.com
<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180215/6b505aa2/attachment.html>
