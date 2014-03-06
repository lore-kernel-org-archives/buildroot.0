From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 22:56:41 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-05
In-Reply-To: <5318AB8C.9050802@mind.be>
References: <20140306073010.F1C12100E3F@stock.ovh.net>
 <5318AB8C.9050802@mind.be>
Message-ID: <20140306225641.59c3c535@skate>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 06 Mar 2014 18:08:28 +0100, Arnout Vandecappelle wrote:
> On 06/03/14 08:30, Thomas Petazzoni wrote:
> >       i686 |                        [7m>>> | TIM | http://autobuild.buildroot.net/results/9d49f31c9dc16d2a2a4aafa535fbb5ea7e24a66f/
> 
>  To be able to do _something_ useful in a case like this, it would be
> nice if output/build/build-time.log was also saved.

I've tentatively modified the scripts on my build server to include
build-time.log in the build results. We'll see if it works.

>  My guess is that the server was just overloaded during that build, so
> maybe it wouldn't help that much, but at least it's something.

There is a 4 hours build duration limit on my server, I don't know if
it's possible that a configuration takes more than 4 hours to build.
This problem is hard to diagnose.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
