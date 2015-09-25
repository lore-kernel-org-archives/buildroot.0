From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Sep 2015 16:14:20 +0200
Subject: [Buildroot] [PATCH v12 1/1] squeezelite: new package
In-Reply-To: <5605101A.3090102@imgtec.com>
References: <201509250304.t8P343dO012199@ms-omx03.plus.so-net.ne.jp>
 <5605101A.3090102@imgtec.com>
Message-ID: <20150925161420.05e33e90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Sep 2015 10:12:58 +0100, Vicente Olivert Riera wrote:

> >>>>> squeezelite v1.8 Downloading
> >> Doing shallow clone
> >> Initialized empty Git repository in
> >> /br/output/build/.squeezelite-v1.8.tar.gz.pb3XtQ/squeezelite-v1.8/
> >> remote: Counting objects: 82, done.
> >> Unpacking objects: 100% (82/82), done.
> >> warning: Remote branch v1.8 not found in upstream origin, using HEAD instead
> >> fatal: unable to read tree 668edec073bef579bedf43817f65aee3a592d0ef
> > Hmm...
> > I have been working on my cached source, so I did not realize it.
> > Yes, I can reproduce your problem with real clean buildroot tree.
> > Maybe something changed https://code.google.com/p/squeezelite repo
> > since my last fetch.
> > I'm considering to change SQUEEZELITE_SITE to github repo like:
> > https://github.com/sixeyed/squeezelite
> > Does this repo work for you too ?
> 
> the fact that it works or not is not the problem. The problem is that
> right now there isn't any official repository for that project, so that
> repository could disappear tomorrow. And I don't know if the owner of
> that repository has made any change to the source code or not.
> 
> Perhaps downloading the tarballs from Google Code and putting them in
> mirror.buildroot.org would be the best option. I have added Peter and
> Thomas on CC so they can tell their opinion about this issue.

What do you want to do this instead of just using the Google Code
tarballs? Yes, I know Google Code will disappear in the future, but
right now, it works, and by the time it will be shut down, hopefully
this project will have found a new hosting.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
