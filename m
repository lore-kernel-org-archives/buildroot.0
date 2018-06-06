From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 23:15:32 +0200
Subject: [Buildroot] Cannot build C++ internal toolchain using uclibc-ng
In-Reply-To: <CAPa8UMezPR1Wuh43Pbt_RAVXFmRCCDRu=Yn1V4s-YpdE2fLA-g@mail.gmail.com>
References: <CAPa8UMePbuAEUCFMvYadN+n-zJN2c-N6B9RXL==BffbDLqww9g@mail.gmail.com>
 <20180606204952.58f73809@windsurf>
 <CAPa8UMezPR1Wuh43Pbt_RAVXFmRCCDRu=Yn1V4s-YpdE2fLA-g@mail.gmail.com>
Message-ID: <20180606231532.5982164d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jun 2018 22:29:33 +0200, Michele Bucca wrote:

> Yes, it shows the same error [1]. By the way here's  the output of a
> clean build that I've made with the commands :
> 
> make clean
> LC_ALL=C make
> 
> [1] https://pastebin.com/Z6vUVmRE
> 

What Linux distribution and version of this distribution are you using
as the host system ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
