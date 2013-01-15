From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 15 Jan 2013 10:27:21 +0100 (CET)
Subject: [Buildroot] New kernel source mode [Proposal]
In-Reply-To: <20130115102403.469d756d@skate>
Message-ID: <570d0031-f552-4545-9ddc-2cec752943c8@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

well, I just checked on my main debian system and apparently host is a standard DNS lookup utility...

oh well, as you said it's enough of a border case not to worry too much....

    Cordialement

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> Dear Jeremy Rosen,
> 
> On Tue, 15 Jan 2013 10:13:08 +0100 (CET), Jeremy Rosen wrote:
> 
> > > Hum? I didn't suggest a host/ part. My proposal, in terms of
> > > build
> > > directories, do not change anything compared to what we have
> > > today:
> > > 
> > > 	output/build/host-foo-1.0/ for the host version of package foo
> > > 	output/build/foo-1.0/ for the target version of package foo
> > 
> > oh, my bad then I misread it as:
> > 
> > 
> >  	output/build/host/foo-1.0/ for the host version of package foo
> >  	output/build/foo-1.0/ for the target version of package foo
> > 
> > nevermind my comment then....
> 
> Ok. That said, your comment still stands in that if we have a package
> named "host", things will be confusing. But it will already be
> confusing as things are today, and I'm not sure we want to fix this
> potential corner case anyway.
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> 
