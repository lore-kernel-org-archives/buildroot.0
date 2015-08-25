From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 12:57:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-08-24
In-Reply-To: <55DC479B.6000406@imgtec.com>
References: <20150825063012.C9C1510159F@stock.ovh.net>
 <55DC42A1.6060003@imgtec.com>
 <20150825123933.382f5e06@free-electrons.com>
 <55DC479B.6000406@imgtec.com>
Message-ID: <20150825125744.406bc9c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Tue, 25 Aug 2015 11:46:51 +0100, Vicente Olivert Riera wrote:

> >>>         mips | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/e1a99784d7cbd5a14808f6d8fc27994b44e996c4/
> >>
> >> Fixed by:
> >>
> >>   http://patchwork.ozlabs.org/patch/507709/
> > 
> > Will have a look.
> 
> I'm working together with the upstream maintaner to provide a patch
> which actually fixes the problem, but he seems to be on summer holidays
> so his reply is being delayed. I think disabling support for libunwind
> is a good temporary solution in order to fix it before the next release.

Yes, sure. Thanks for working on this.

> 
> >>>     mips64el |                   midori-0.5.9 | NOK | http://autobuild.buildroot.net/results/80ffdf54fd675fbff5a645784cd041cdf862154c/
> >>>     mips64el |                   midori-0.5.9 | NOK | http://autobuild.buildroot.net/results/1c049845ade60de223296c77c8a70869c4db64f0/
> >>
> >> Currently investigating.
> > 
> > Thanks!
> 
> And cannot reproduce it :/ Sorry, let's see if future build reports
> still hightlight this failure.

Well:

--   package 'webkit2gtk-3.0>=1.11.91' not found
--   package 'javascriptcoregtk-3.0' not found

and we don't have webkit2gtk-3.0, we only have webkit2gtk. But I'm a
bit surprised, since Gustavo bumped webkitgtk and midori at the same
time. Gustavo, can you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
