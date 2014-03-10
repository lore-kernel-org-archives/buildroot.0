From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Mon, 10 Mar 2014 14:03:06 -0500
Subject: [Buildroot] [PATCH 3/3] rsyslog: bump to version 6.3.8
In-Reply-To: <OF14BFD3A2.E76317EC-ON86257C97.004F3333-86257C97.00500AF5@LocalDomain>
References: <1394459809-22174-1-git-send-email-clshotwe@rockwellcollins.com>
 <1394459809-22174-3-git-send-email-clshotwe@rockwellcollins.com>
 <OF14BFD3A2.E76317EC-ON86257C97.004F3333-86257C97.00500AF5@LocalDomain>
Message-ID: <OF6BF2D5D9.6086FE5F-ON86257C97.00686C68-86257C97.00688E01@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan J Barnett/USA/RockwellCollins wrote on 03/10/2014 09:34:21 AM:

> From: Ryan J Barnett/USA/RockwellCollins
> To: Clayton Shotwell <clshotwe@rockwellcollins.com>
> Cc: buildroot at buildroot.org, buildroot-bounces at busybox.net
> Date: 03/10/2014 09:34 AM
> Subject: Re: [Buildroot] [PATCH 3/3] rsyslog: bump to version 6.3.8
> 
> Clayton,
> 
> Clayton Shotwell <clshotwe@rockwellcollins.com> wrote on 03/10/2014 
> 08:56:49 AM:
> 
> > 
> 
################################################################################
> > 
> > -RSYSLOG_VERSION = 5.8.0
> > +RSYSLOG_VERSION = 6.3.8
> >  RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
> > -RSYSLOG_DEPENDENCIES = zlib
> > +RSYSLOG_DEPENDENCIES = zlib libestr libee
> > 
> >  # Build after Busybox
> >  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> 
> Checking the website for rsyslog it appears that the latest version is 
> 7.6.0. Is there a reason to not bump to this version? Also could you add 

> the license information since there doesn't appear to be any for this 
> package?

I went with 6.3.8 initially because that was the version that contained 
the feature I need to use.  I didn't even check for a newer version.  I 
will get the 7.6.0 built and tested and then I will resubmit my patches.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
