From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Jan 2009 09:33:21 -0200
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <1232523725.11888.11.camel@elrond.atmel.com>
References: <1232523725.11888.11.camel@elrond.atmel.com>
Message-ID: <49770801.70809@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:

> Using gcc-4.2.4, bu-2.18, uclibc-0.9.30
> wchar, largefile,ipv6, NWFPE
> 
> Not all packages has been tested.
> Some key packages that I do not get to build are
>
> php                 

This works for me with gcc-4.3.2, binutils-2.19, uclibc-0.9.30 with
wchar, largefile, ipv6 and softfloat with a buildroot snapshot from
20090105.
I can try svn or some other snap, though i don't think things changed
that much so as to break them.
Regards.
