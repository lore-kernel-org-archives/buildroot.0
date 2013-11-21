From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Thu, 21 Nov 2013 16:39:01 -0600
Subject: [Buildroot] [PATCH 1/1] xerces: add host
In-Reply-To: <20131121225446.2ad2f3c2@skate>
References: <1385063284-31586-1-git-send-email-mlweber1@rockwellcollins.com>
 <20131121225446.2ad2f3c2@skate>
Message-ID: <OFDA43EF93.FECF1729-ON86257C2A.007C345A-86257C2A.007C6C20@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 11/21/2013 
03:54:46 PM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 11/21/2013 03:54 PM
> Subject: Re: [Buildroot] [PATCH 1/1] xerces: add host
> 
> Dear Matt Weber,
> 
> On Thu, 21 Nov 2013 13:48:04 -0600, Matt Weber wrote:
> > 
> > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> > ---
> >  package/xerces/xerces.mk |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> Yes, but why?

Opps, should have included that.

I'm working on adding support for an older package called xalan that 
requires host-xerces.
However the build infrastructure in the xalan package is pretty bad and 
I'm not sure if I'll be 
able to get it cleaned up to the point of posting a patch set.  So for 
now, I've submitted 
this patch to add host-xerces support to allow us to build the xalan 
package using 
BR2_EXTERNAL until I get it hopefully cleaned up and submitted.

> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
