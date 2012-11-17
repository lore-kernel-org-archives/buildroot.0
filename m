From: Alexander Khryukin <alexander@mezon.ru>
Date: Sat, 17 Nov 2012 12:08:32 +0300
Subject: [Buildroot] gcc on target system issue
In-Reply-To: <87vcd4wsxg.fsf@dell.be.48ers.dk>
References: <CABtOAfxKdUhvGHF2K_BG__vPPcqmio24DW0suz86Hfzngzc01g@mail.gmail.com>
 <20121116183044.6dcfc297@skate>
 <CABtOAfyM4gF-AUi0cNSusC542dxcRps=TM20pJe3RdXWU69AuA@mail.gmail.com>
 <87vcd4wsxg.fsf@dell.be.48ers.dk>
Message-ID: <CABtOAfy+rFn9Nn16js3ihTyQPkZQPccS1hRmKd3fevbzeyBPqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/17 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Alexander" == Alexander Khryukin <alexander@mezon.ru> writes:
>
> Hi,
>
>  Alexander> i'm embedded linux developer and trying to build
>  Alexander> OpenMandriva linux for cortex-a9, but without gcc on target
>  Alexander> my work is totally unuseful.
>
> Ok, but is buildroot the right tool for that job? It would imho make
> more sense to install a full blown distribution supporting ARM
> (Debian/Fedora/Ubuntu/..) and use that to rebuild the mandriva packages.
>
> --
> Bye, Peter Korsgaard
>


I want  generate image for few archs like cortex a8 with hardfloat,
without, cortex-a9 with\withou, etc.
few months ago buildroot was selected as the best solution
Now i finished to adding all distro-dependent packages and trouble only
with gcc
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121117/d5ec05ea/attachment.html>
