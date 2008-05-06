From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 6 May 2008 01:19:10 -0300
Subject: [Buildroot] gdb 6.7 patches doesn't apply.
Message-ID: <d6cda7730805052119q5ecb1060i73181ce989a6b6d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a problem with toolchain/gdb/6.7.1/*.patch

None of them applies cleanly. Taking them out and just adding the
avr32 patch from avr32linux.org builds cleanly.
