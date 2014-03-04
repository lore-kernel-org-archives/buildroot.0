From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Tue, 4 Mar 2014 09:16:20 -0600
Subject: [Buildroot] [PATCH 1/1] pyrex: new package
In-Reply-To: <20140303220417.6835ec44@skate>
References: <1379700560-10738-1-git-send-email-mlweber1@rockwellcollins.com>
 <20140303220417.6835ec44@skate>
Message-ID: <OFDE37491E.EE5530A4-ON86257C91.00539055-86257C91.0053E4B7@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, 

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net, "Ryan Barnett" <rjbarnet@rockwellcollins.com>
> Date: 03/03/2014 03:04 PM
> Subject: Re: [Buildroot] [PATCH 1/1] pyrex: new package
> 
> Dear Matt Weber,
> 
> On Fri, 20 Sep 2013 13:09:20 -0500, Matt Weber wrote:
> 
> > index 0000000..551c15c
> > --- /dev/null
> > +++ b/package/python-pyrex/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_PYTHON_PYREX
> > +   bool "pyrex"
> > +   depends on BR2_PACKAGE_PYTHON
> > +   help
> > +     Pyrex is a language for writing Python extension modules
> > +
> > +     http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
> 
> If I understand correctly what Pyrex is, it is a tool that generates C
> code that then needs to be compiled with gcc. At least that's what I
> understand from http://ldots.org/pyrex-guide/2-compiling.html.
> 
> Therefore, I am wondering how useful it is to support the installation
> of python-pyrex to the target, while we don't have the support for
> providing a compiler on the target.
> 
You are correct.  Our use case was just as a host tool to aid in our
application build using the sysroot and not on target.

Thanks,
Matt Weber
