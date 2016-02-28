From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 28 Feb 2016 10:25:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-27
In-Reply-To: <20160228073020.78AB7101EC4@stock.ovh.net>
References: <20160228073020.78AB7101EC4@stock.ovh.net>
Message-ID: <1456651515.13955.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2016-02-28 at 08:30 +0100, Thomas Petazzoni wrote:
>?
> ?????powerpc |????????????????????czmq-v3.0.2 | NOK |
> http://autobuild.buildroot.net/results/2061238affb685db998100a56c6571
> 538d089a5b/

/home/test/autobuild/instance-3/output/host/usr/powerpc-buildroot-
linux-uclibc/sysroot/usr/lib/libstdc++.a(compatibility-ldbl.o): In
function `std::tr1::hash<long double>::operator()(long double) const':
compatibility-ldbl.cc:(.text._ZNKSt3tr14hashIeEclEe+0x3c): undefined
reference to `frexpl'

I cannot reproduce it on my 64-bit host.

Best regards
J?rg Krause
