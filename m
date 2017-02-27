From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 27 Feb 2017 13:23:44 +1100
Subject: [Buildroot] Analysis of build results for 2017-02-25
In-Reply-To: <20170226223353.39284983@free-electrons.com>
References: <20170226072845.0954E20755@mail.free-electrons.com>
 <20170226223353.39284983@free-electrons.com>
Message-ID: <20170227022344.GA6762@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 26, 2017 at 10:33:53PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Sam, Cyril, Frank, Gustavo, Waldemar, Vicente, see below.
> 
> On Sun, 26 Feb 2017 08:28:45 +0100 (CET), Thomas Petazzoni wrote:

[snip]

> >  powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/8789303587f693d5104506a7db361e1322091fd1
> 
> unresolvable R_PPC64_ADDR64 against `rand@@GLIBC_2.17'
> 
> Sam, could you have a look ?

Yes. No idea yet what this problem is but trying to reproduce it now.

[snip]

> >  powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/3cbe65a46e75b8e67846d593884c96df97dec7a4
> 
> Would be fixed by https://patchwork.ozlabs.org/patch/724932/, but a
> better patch was suggested, but never submitted.

It looks like there is an active upstream and all we need to do is jump
through enough hoops, so I'll try pushing Samuel Martin's patch or one
like it when I have a bit of time.

Cheers,
Sam.
