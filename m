From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 13 Apr 2017 19:18:57 +0200
Subject: [Buildroot] [PATCH 2/2] binutils: add patch for 2.27 that fixes
 elf2flt segfaults
In-Reply-To: <579cec15-214a-978c-85ca-1f471f104deb@mind.be>
References: <20170410084238.13201-1-arnout@mind.be>
 <20170410084238.13201-2-arnout@mind.be>
 <20170413093643.05ffb764@free-electrons.com>
 <579cec15-214a-978c-85ca-1f471f104deb@mind.be>
Message-ID: <20170413171857.GA11446@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Arnout Vandecappelle wrote,

> 
> 
> On 13-04-17 09:36, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Mon, 10 Apr 2017 10:42:38 +0200, Arnout Vandecappelle
> > (Essensium/Mind) wrote:
> > 
> >>  .../2.27/0011-arm-thumb-fix-elf2flt-segfault.patch | 927 +++++++++++++++++++++
> >>  1 file changed, 927 insertions(+)
> >>  create mode 100644 package/binutils/2.27/0011-arm-thumb-fix-elf2flt-segfault.patch
> > 
> > Thanks a lot for doing the bisection! However, this is really a big
> > patch. 
> 
>  Yes...
> 
> > Do we understand what it does? 
> 
>  I've tried, but... no. The great thing about this patch is that its purpose is
> to add support for entering/exiting Secure Mode on ARMv8. So this really
> shouldn't impact a Cortex-M4...
> 
> > Do we know if it is safe to
> > backport it on 2.27 without other patches?
> 
>  Nope :-)
> 
> > Isn't there a more minimal fix for binutils 2.27?
> 
>  Possibly. Is someone here somewhat familiar with elf2flt? Waldemar?

No Sorry. Either you might ask on the mailinglist (uclinux) or we
could just skip 2.27 and move on..
 
best regards
 Waldemar
