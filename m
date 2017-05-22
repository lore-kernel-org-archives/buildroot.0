From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 22 May 2017 19:22:14 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-18
In-Reply-To: <20170519214454.08c259df@free-electrons.com>
References: <20170519063157.2654320766@mail.free-electrons.com>
 <20170519214454.08c259df@free-electrons.com>
Message-ID: <1495480933.20961.55.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2017-05-19 at 21:44 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 19 May 2017 08:31:57 +0200 (CEST), Thomas Petazzoni wrote:
>?
> > ?????????arc |???????????????????quagga-1.1.1 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_ffc84eb0
> > 8e32dabdccc579d67c8d1f8ae71ab1e4&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=0LYQlMzI9D5n6XsyeqEGqg4ii88QIXh
> > 418hRH-Uw8cA&s=mu0MUYnbYvnsfZGE0JraJzF0s4kBlmHjASZovSIox8M&e=??| ORPH
> 
> Compiler failure on ARC:
> 
> ? ospf_ri.c:839:1: internal compiler error: in extract_insn, at recog.c:2287
> 
> Alexey, is this one already known?

Nope, just reported it to our compiler guy.
Hopefully it gets fixed in a day or two, stay tuned.

-Alexey
