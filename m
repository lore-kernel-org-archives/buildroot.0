From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 10 Aug 2011 12:18:33 +0200
Subject: [Buildroot] [PATCH 1/3] new package: gssdp
In-Reply-To: <201108101101.28784.yann.morin.1998@anciens.enib.fr>
References: <1312965667-15157-1-git-send-email-s.neumann@raumfeld.com>
 <201108101101.28784.yann.morin.1998@anciens.enib.fr>
Message-ID: <1312971514.10073.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-08-10 at 11:01 +0200, Yann E. MORIN wrote:
> On Wednesday 10 August 2011 104105 Sven Neumann wrote:
> > GSSDP implements resource discovery and announcement over SSDP.
> [--SNIP--]
> > +GSSDP_VERSION = 0.8.2
> 
> Any reason for not using newer versions?
>  - gssdp    : 0.10.0
>  - gupnp    : 0.16.1
>  - gupnp-av : 0.8.0

Yes, these are not working for us. I am still trying to resolve those
issues with the gupnp team and will propose an update at some point. But
at this point I am proposing the versions that are known to compile and
to work with buildroot and uCLibC.


Sven
