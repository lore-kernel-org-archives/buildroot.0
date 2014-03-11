From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Tue, 11 Mar 2014 15:07:31 -0500
Subject: [Buildroot] [PATCH v2 1/4] libestr: new package
In-Reply-To: <531F6B18.4050305@trzebnica.net>
References: <1394560632-1923-1-git-send-email-clshotwe@rockwellcollins.com>
 <531F6B18.4050305@trzebnica.net>
Message-ID: <OF3C3BB4D1.F7D90DF5-ON86257C98.006E42A2-86257C98.006E8C05@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> wrote on 03/11/2014 
02:59:20 PM:

> From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> To: Clayton Shotwell <clshotwe@rockwellcollins.com>, 
buildroot at busybox.net
> Date: 03/11/2014 02:59 PM
> Subject: Re: [Buildroot] [PATCH v2 1/4] libestr: new package
> > +LIBESTR_VERSION = 0.1.9
> > +LIBESTR_SITE = http://libestr.adiscon.com/files/download/
> > +LIBESTR_LICENSE = LGPLv2.1+
> > +LIBESTR_LICENSE_FILE = COPYING
> 
> It should be:
> 
> LIBESTR_LICENSE_FILES = COPYING

Thanks for catching that.  I'll get that changed in all of my patches and 
resubmit them.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
