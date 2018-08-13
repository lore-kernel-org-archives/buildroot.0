From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Aug 2018 13:33:16 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-11
In-Reply-To: <20180812223629.2bac8ebe@windsurf>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
Message-ID: <e2d13896-1729-29da-ba47-b123154cee65@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 12/08/2018 ? 22:36, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Matt, Hollis, Romain, J?rg, Bernd, there are some questions for you
> below.
> 
> On Sun, 12 Aug 2018 08:00:15 +0200 (CEST), Thomas Petazzoni wrote:
> 

[snip]

>>      powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/d63727755d671ef6ac484fe26a79793123976651 |     
> 
> iquant_intra.c: In function 'iquant_intra_m1_altivec':
> iquant_intra.c:122:10: internal compiler error: Segmentation fault
>      vsrc = vec_ld(offset, (signed short*)src);
>      ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Someone needs to dig into gcc bug reports, test with a more recent gcc,
> etc. Romain, this is usually your stuff :-)
>  
>>         m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/295710ddc7ac11a88a2e8986ad35ac1803c7fe12 |     
> 
> src/dish.cpp: In constructor 'zmq::dish_t::dish_t(zmq::ctx_t*, uint32_t, int)':
> src/dish.cpp:49:1: internal compiler error: in connect_traces, at
> dwarf2cfi.c:2752.
> 
> Another nice compiler failure. Romain ? :-)

I'll take a look but I don't have much time this month, I'm on holidays :)

Best regards,
Romain

> 
> Thomas
> 
