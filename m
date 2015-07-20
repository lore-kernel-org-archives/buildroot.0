From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Jul 2015 15:44:08 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-19
In-Reply-To: <CA+BsyQ4=X7ZA0LTiHNo4SAC2FotUJGL+3xb1LgjNjFUQCUBk+g@mail.gmail.com>
References: <20150720063017.2400B101C74@stock.ovh.net>
 <CA+BsyQ4=X7ZA0LTiHNo4SAC2FotUJGL+3xb1LgjNjFUQCUBk+g@mail.gmail.com>
Message-ID: <20150720124408.GM13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brendan,

On Mon, Jul 20, 2015 at 01:30:24PM +0100, Brendan Heading wrote:
> On 20 July 2015 at 07:30, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
> 
> > Build statistics for 2015-07-19
> > ===============================
> >
> >         success : 230
> >        failures : 125
> >        timeouts : 6
> >           TOTAL : 361
> >
> > Classification of failures by reason
> > ====================================
> >
> 
> [..]
> 
> hi all, new to the buildroot list - I have some free time, and I've been
> using buildroot for a while in projects with my previous employer, so I'm
> keen to repay some of the time and effort it has saved me in the past. This
> list of bugs looks like a great place to start ;)
> 
> Shall I just begin to submit patches or are there likely to be people
> already looking at these issues ?

Welcome. Looking into autobuild issues and posting patches is a great way to 
start. Make sure to read 
http://nightly.buildroot.org/manual.html#_analyzing_and_fixing_autobuild_failures
before you start. An overlap in autobuild issues fixing happen at times, but 
it's quite rare. Anyone is allowed and encouraged to post build failure fixes, 
as well as run-time failures, though the autobuilder currently doesn't catch 
failures of the latter type.

> The fan-ctrl failure for all arches looks like it might have been a
> sourceforge problem. The package is fetched from a sourceforge svn
> repository (regular package tarball downloads from sourceforge look OK).
> Maybe sourceforge have been fiddling with things, I haven't checked.

It most likely has to do with recent sourceforge infrastructure issues 
(http://sourceforge.net/blog/sourceforge-infrastructure-and-service-restoration/).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
