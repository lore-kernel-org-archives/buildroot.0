From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 03 Oct 2014 16:50:49 +0200
Subject: [Buildroot] qemu
References: <542EB59F.9090002@free.fr>
Message-ID: <XnsA3BBAB5FB1F74berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane ANCELOT <sancelot@free.fr> wrote in 
news:542EB59F.9090002 at free.fr:

> how to enable the qemu package ? I can not find it.

Hi,

apparently the qemu package is only available as a host package, it is not 
meant to be cross-compiled for the target arch and can therefore not be 
enabled in menuconfig.

Qemu was used by the perl package for cross-compiling, this was removed in 
favour of perl-cross in 2012: 
http://git.buildroot.net/buildroot/commit/package/perl/perl.mk?id=
234fe4433489bca81b79311239569525cc008d9d

Regards, Bernd
