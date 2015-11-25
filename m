From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Nov 2015 17:54:25 +0100
Subject: [Buildroot] WiringPi - problem adding package to my buildroot
In-Reply-To: <CACvocV5KQjCEcXXx9h8pLcJpZ6QvbMBooyMxL+kg4tjHxZG7bA@mail.gmail.com>
References: <CACvocV5bQo_YG05=ujYEJHygDQCw6_XZDLJ9zdCLO4tGCSswtg@mail.gmail.com>
 <20151124204035.7ecad2e8@gmx.net>
 <CACvocV5KQjCEcXXx9h8pLcJpZ6QvbMBooyMxL+kg4tjHxZG7bA@mail.gmail.com>
Message-ID: <20151125175425.7bab60cc@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Nov 2015 16:30:09 +0100, "astrolite ." <ciclonite@gmail.com> wrote:

> Hi Peter,
> 
> 
> but build failed with
> >         config.status: error: cannot find input file: `Makefile.in'
> >
> > in the base directory, maybe a autoreconf/configure/make in the
> > subdirectory wiringPi works?
> 
> 
> Sorry but i cannot find where is the problem.
> There a version of wiringPi that i integrate directly on buildroot-2015-5?
> 
> Thanks and sorry for disturb.

Try this patch [1] against buildroot, adding wiringPi support to buildroot
using the original wiringPi source from git://git.drogon.net/wiringPi
(did not test it against buildroot-2015-5, but worked for me with current git
master: gpio command runs on rpi hardaware)...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/548287/
