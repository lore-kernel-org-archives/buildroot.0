From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 6 Aug 2007 23:04:32 +0200
Subject: [Buildroot] [patch] libxml2 fixes
References: <46B739FF.5020507@mainstreetsoftworks.com>
	<02f001c7d869$de70f960$dcc4af0a@atmel.com>
	<46B78B3B.1070002@mainstreetsoftworks.com>
Message-ID: <03ab01c7d86f$43b6ee60$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Brad House" <brad@mainstreetsoftworks.com>
To: "Ulf Samuelsson" <ulf@atmel.com>
Cc: <buildroot@uclibc.org>
Sent: Monday, August 06, 2007 10:57 PM
Subject: Re: [Buildroot] [patch] libxml2 fixes


>> When I tried to build libxml2 using a toolchain without wchar support
>> it failed, when it is built with a toolchain supporting wchar, it completes the build.
> 
> When was this?

2-3 weeks ago.

> and with what version of libxml2?

libxml2 version from buildroot.

> and on what architecture?


generic-arm architecture.

> On x86 and arm, that is not the case from my experience.
> Can you also provide some more information on the actual error message?

I killed that toolchain, so I do not have the error handy
You can easily generate a new gcc-4.2.0/binutils-2.17 toolchain based on uClibc 0.29 without wchar
for generic-arm.


> 
> Thanks.
> -Brad
>




Best Regards
Ulf Samuelsson
