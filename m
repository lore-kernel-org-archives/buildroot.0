From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 20:40:07 +0100
Subject: [Buildroot] [PATCH] libselinux: set PREFIX to generate proper
 .pc file
In-Reply-To: <20180107165132.GB27635@gmail.com>
References: <20180106145249.3090-1-marcus.folkesson@gmail.com>
 <20180107151618.62c734e2@windsurf>
 <20180107162434.GA27635@gmail.com>
 <20180107173427.1dc604d7@windsurf>
 <20180107165132.GB27635@gmail.com>
Message-ID: <20180107204007.6c8c3f1c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Jan 2018 17:51:32 +0100, Marcus Folkesson wrote:

> > > If PREFIX=/usr at install time, it tries to install on the host
> > > system.  
> > 
> > That's bogus.  
> 
> Just to make clear - *this* package will try to install on the host
> system.

I don't follow you here.

> >  - We fix libselinux Makefile to have a more standard DESTDIR/PREFIX
> >    usage.  
> 
> I think we should go for this one in the long run.
> I will try to come up with something and get it upstreams for the
> selinux project.
> 
> Should we keep libselinux Makefile as-is in meanwhile or add patches?

We can add patches, especially if you are pushing them upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
