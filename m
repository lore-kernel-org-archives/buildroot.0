From: Julien Boibessot <julien.boibessot@free.fr>
Date: Tue, 18 Nov 2008 17:56:00 +0100
Subject: [Buildroot] tslib 1.0 patches status
Message-ID: <4922F3A0.2030902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I think there are some "no more useful" / inappropriate patches in
buildroot/package/tslib/.

What are the status of the following requests ? :
* http://www.uclibc.org/lists/buildroot/2008-March/007246.html
* http://www.uclibc.org/lists/buildroot/2008-July/009594.html

Moreover with recent Linux kernels (tested on 2.6.27 on ARM9), the
following patch is needed for tslib to work:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=499446
(Don't pay attention on patch title, it is mandatory on ARM9 too)

Wouldn't it be the time to integrate that things all together ?? (I'm
ready to help)

Regards,
Julien
