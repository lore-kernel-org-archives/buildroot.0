From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 25 Aug 2015 10:36:10 +0200
Subject: [Buildroot] uClibc-ng 1.0.6 update
In-Reply-To: <1440450025.2745.25.camel@synopsys.com>
References: <1440430574.2745.13.camel@synopsys.com>
 <BCD08FBE-D0D8-4720-A851-F66BB2D256BE@waldemar-brodkorb.de>
 <1440450025.2745.25.camel@synopsys.com>
Message-ID: <20150825083610.GA27782@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Alexey Brodkin wrote,

> Hi Waldemar,
> 
> On Mon, 2015-08-24 at 18:09 +0200, Waldemar Brodkorb wrote:
> > Hi,
> > 
> > i have planned, but didn't started yet.
> > So if you want to do it, i am very happy. being a little busy at the moment.
> 
> Ok I think I'll do that this week.
> 
> > It also includes the right symlink fix and the arc boost fixes. may be a patch series including arc switch to uclibc
> > -ng?
> 
> Yeah I already noticed a proper fix... after I spent nearly 2 days trying to debug
> failing dynamic linker (that's with your initial fix).

Yeah, sorry. Had a three days business trip and didn't had the time
to fix it directly. Normally I do runtime tests before pushing any
change. I promise I will do it always in the future :)
 
> So now with new fix I may confirm that uclibc not only gets built but also
> could be executed on target properly.
> 
> As for switching ARC to uClibc-ng I'm not sure this is the best idea
> now when we're already on Buidlroot 2015.08-rc1. So probably I'll do that
> right after final release of 2015.08 happens.

Yeah, sure. I don't meant that 1.0.6 should be included in 2015.08.
But there is -next for new stuff.
 
best regards
 Waldemar
