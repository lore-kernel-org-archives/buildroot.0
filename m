From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 13:43:38 +0100
Subject: [Buildroot] [PATCH 2/2] gcc: remove 4.5.x
In-Reply-To: <56CEDD11.7060603@zacarias.com.ar>
References: <1456336840-14890-1-git-send-email-gustavo@zacarias.com.ar>
 <1456336840-14890-2-git-send-email-gustavo@zacarias.com.ar>
 <87io1d3mhr.fsf@dell.be.48ers.dk>
 <20160225104848.2f5d892f@free-electrons.com>
 <87h9gxxgc7.fsf@dell.be.48ers.dk>
 <56CEDD11.7060603@zacarias.com.ar>
Message-ID: <20160225134338.4973dffd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 25 Feb 2016 07:53:05 -0300, Gustavo Zacarias wrote:
> On 25/02/16 06:57, Peter Korsgaard wrote:
> 
> >   >> What do we do with our 4.5 based external toolchains and
> >   >> BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 (used by directfb)?
> >
> >   > I think the BR2_TOOLCHAIN_GCC_AT_LEAST_* must be kept for pretty much
> >   > all versions of gcc. This symbol is not related to whether we support
> >   > that gcc version in our internal toolchain backend or not. Possibly any
> >   > gcc version can be used with the external toolchain backend.
> >
> > True, but we might consider removing preconfigured external toolchains
> > using ancient versions if there's sensible newer alternatives available.
> 
> Blackfin is 4.5.x so at least this low we must keep.

Blackfin is actually 4.3.

They have an alpha 4.5 compiler, but when we switched to it, many
things broke and the ADI guys told us to stay on 4.3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
