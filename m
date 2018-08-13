From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:33:58 +0200
Subject: [Buildroot] [PATCH 12/17] perl-template-toolkit: new package
In-Reply-To: <CAB0FRsuTNsRPaBAUB26k10y6Ubuzg9bpFRz3i2E2kkX9vOFqSg@mail.gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-13-chrismcc@gmail.com>
 <CAB0FRsuTNsRPaBAUB26k10y6Ubuzg9bpFRz3i2E2kkX9vOFqSg@mail.gmail.com>
Message-ID: <20180813233358.5d0c6839@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 10:04:30 +0200, Fran?ois Perrad wrote:

> > +PERL_TEMPLATE_TOOLKIT_VERSION = 2.27
> > +PERL_TEMPLATE_TOOLKIT_SOURCE = Template-Toolkit-$(PERL_
> > TEMPLATE_TOOLKIT_VERSION).tar.gz
> > +PERL_TEMPLATE_TOOLKIT_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABW
> > +PERL_TEMPLATE_TOOLKIT_DEPENDENCIES = host-perl-cgi perl-appconfig
> >  
> 
> In fact, host-perl-cgi could be removed, and the patches 01-02-03/17 become
> useless.

I have marked patches 01/17, 02/17 and 03/17 as Rejected. Then I have
marked this patch 12/17 as "Changes Requested".

Christopher: please send a new iteration of this patch 12/17.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
