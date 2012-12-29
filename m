From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 03:45:48 +0200
Subject: [Buildroot] (no subject)
Message-ID: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all

Finally after dosens of reruns got damn Mesa 8.0.5 to compile.
The biggest obstacle was src/glsl/builtin_compiler but after
searching Net for how others had done it I finally got it.

mesa3d-uclibc-locale.patch did not apply cleanly anymore to this
version.
So I had to fetch new one from openembedded repo.
Did take also few other patches from there 
and fixed execinfo.h stuff.

Regards:
Stefan
