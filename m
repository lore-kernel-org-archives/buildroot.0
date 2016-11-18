From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 09:46:37 +0100
Subject: [Buildroot] [PATCH 03/10] docs/manual: document the waf-package
 infra
In-Reply-To: <20161117204739.GD3574@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <e41ab5eee8961c89c1fe9c4566383844e36b24f9.1477843328.git.yann.morin.1998@free.fr>
 <20161117000456.04b7e672@free-electrons.com>
 <20161117204739.GD3574@free.fr>
Message-ID: <20161118094637.502607c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 21:47:39 +0100, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-11-17 00:04 +0100, Thomas Petazzoni spake thusly:
> > On Sun, 30 Oct 2016 17:02:14 +0100, Yann E. MORIN wrote:  
> [--SNIP--]
> > > +* +LIBFOO_BUNDLED_WAF+ can be set to +YES+ or +NO+ to tell Buildroot to
> > > +  use the bundled +waf+ executable. If set to +YES+, the default, then  
> > YES is in fact not the default :-)  
> 
> Well, "! NO" is the default. ;-)

Nope, I think you're getting it wrong like on IRC. The default is
actually empty, which means "YES", i.e "the waf script is bundled and
there is no need to add a dependency on host-waf".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
