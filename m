From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 7 Jan 2014 08:16:59 -0600
Subject: [Buildroot] [PATCH v2] added python unicode selection to menu
In-Reply-To: <20140107132316.1b79f953@skate>
References: <1389043062-29826-1-git-send-email-mlweber1@rockwellcollins.com>
 <20140107132316.1b79f953@skate>
Message-ID: <OF20FA0FD3.D2194933-ON86257C59.004E4CE8-86257C59.004E75C7@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 01/06/2014 
11:23:16 PM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 01/06/2014 11:23 PM
> Subject: Re: [Buildroot] [PATCH v2] added python unicode selection to 
menu
> 
> Dear Matt Weber,
> 
> On Mon, 6 Jan 2014 15:17:42 -0600, Matt Weber wrote:
> 
> > +# Default is UCS2 w/o a conf opt
> > +ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
> > +HOST_PYTHON_CONF_OPT += --enable-unicode=ucs4
> > +PYTHON_CONF_OPT      += --enable-unicode=ucs4
> > +endif
> 
> Why is the selection of UCS4 for the target tied to the usage of UCS4
> on the host?

No specific reason, other then we couldn't come up with a case
where you could want the host different from the target.

Thanks!
Matt Weber
mlweber1 at rockwellcollins.com

> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
