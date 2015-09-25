From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Sep 2015 14:33:14 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add option to
 enable/disable ipv6 support
In-Reply-To: <56053D9C.6030703@zacarias.com.ar>
References: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
 <20150923230236.5b5c5302@free-electrons.com>
 <0dc07792d2e04be6b1628563695e9e28@LysExc01.nanotronic.local>
 <20150925140611.13ec8719@free-electrons.com>
 <56053D9C.6030703@zacarias.com.ar>
Message-ID: <20150925143314.4b90fefe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Sep 2015 09:27:08 -0300, Gustavo Zacarias wrote:

> Hi Thomas.
> Size delta kernel 4.2.1 x86_64_defconfig:
> System is 5879 kB vs 5704 kB
> Not much.

Still quite a bit, but not huge either.

> Keep in mind that even if we introduce the ipv6 option back this will be 
> an issue anyway with glibc and musl-based systems since the kernel might 
> lack ipv6 as well, sounds more like a bug than anything else.

Yes, probably libwebsockets should be able to work with IPv6 enabled
even if IPv6 support is disabled in the kernel, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
