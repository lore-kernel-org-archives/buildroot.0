From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 24 Nov 2016 16:26:24 +0100
Subject: [Buildroot] Analysis of build results for 2016-11-23
In-Reply-To: <20161124094429.4152c19b@free-electrons.com>
References: <20161124073011.C2C1620BD5@mail.free-electrons.com>
 <20161124094429.4152c19b@free-electrons.com>
Message-ID: <20161124152623.GH27313@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> Christian, Waldemar, Sam, Bernd, Alexey, Vlad, Vicente, J?rg, Fran?ois,
> please see below, there are some questions for you.
> 
> Summary of the build failures:
> 
>  - musl related:		8
>  - misc:			7
>  - static linking:		4
>  - PowerPC64le libtool:		2
>  - ARC related:			2
>  - uClibc-ng related:		1
>  - unknown:			1
> 
> So musl continues to be a pain to support, causing the biggest number
> of build failures...
> 
> On Thu, 24 Nov 2016 08:30:11 +0100 (CET), Thomas Petazzoni wrote:
> 
> >      powerpc |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/08a458572a2e9c599dd32b837b1e5c02a6721973
> 
> unwind-dw2-fde-dip.c:465: undefined reference to `dl_iterate_phdr'
> 
> Waldemar, this is with uClibc-ng, and it seems like a relatively recent
> problem. Any idea?
> 

I thought it is a Xtensa specific issue, as now it happens for
PowerPC I need to dig deeper.
Strange that I couldn't reproduce it with OpenADK with uClibc-ng
1.0.19 and master.

best regards
 Waldemar
