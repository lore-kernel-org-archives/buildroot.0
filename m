From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jan 2013 10:24:03 +0100
Subject: [Buildroot] New kernel source mode [Proposal]
In-Reply-To: <381d2c6f-0bcd-47a7-ae57-75f53b71d7a2@zimbra2.corp.accelance.fr>
References: <20130115092231.35fa854a@skate>
 <381d2c6f-0bcd-47a7-ae57-75f53b71d7a2@zimbra2.corp.accelance.fr>
Message-ID: <20130115102403.469d756d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Tue, 15 Jan 2013 10:13:08 +0100 (CET), Jeremy Rosen wrote:

> > Hum? I didn't suggest a host/ part. My proposal, in terms of build
> > directories, do not change anything compared to what we have today:
> > 
> > 	output/build/host-foo-1.0/ for the host version of package foo
> > 	output/build/foo-1.0/ for the target version of package foo
> 
> oh, my bad then I misread it as:
> 
> 
>  	output/build/host/foo-1.0/ for the host version of package foo
>  	output/build/foo-1.0/ for the target version of package foo
> 
> nevermind my comment then....

Ok. That said, your comment still stands in that if we have a package
named "host", things will be confusing. But it will already be
confusing as things are today, and I'm not sure we want to fix this
potential corner case anyway.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
