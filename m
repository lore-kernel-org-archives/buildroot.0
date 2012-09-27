From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 27 Sep 2012 18:52:29 +0300
Subject: [Buildroot] How to enable sighold and sigrelse in uClibc ?
Message-ID: <5064763D.8010203@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone

I need to enable sighold() and sigrelse() functions in uClibc (version
0.9.33 using NPTL)
and I have enabled the corresponding UCLIBC_SUSV4_LEGACY (Enable SuSv4
Legacy or obsolescent functions)
option in .config.

However, when trying to use those functions in application they are
undeclared and
indeed, when checking from uClibc source directory libc/signal I see
that they are not even compiled
(no sighold.o and sigrelse.o).

So what else is needed to make sighold.o and sigrelse.o ?

Best regards
Stefan

P.S:  
Is there __fxstat64() function somewhere in uClibc ?
