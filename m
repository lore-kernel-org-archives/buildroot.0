From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Aug 2013 09:47:32 +0200
Subject: [Buildroot] autobuild statistics graph
In-Reply-To: <521F6FCD.3020500@mind.be>
References: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
 <20130828091036.1a91b786@skate>
 <CAAXf6LWFMtmDpFvZODkd3N_Wsk-VwNP-QVkquRhn3B2aiOjCqg@mail.gmail.com>
 <20130828094824.5f917f48@skate>
 <CAAXf6LWz7_RYds7Zr7kdQHvhYXtNO1WEP+RX+0TTthfZURvi+Q@mail.gmail.com>
 <CAAXf6LVPQVzQpfCdeVrm2yNzEad8j2GS9pnna7YiKVnhTb=MQg@mail.gmail.com>
 <20130829101513.60e3eb48@skate>
 <CAAXf6LUW_=aWd9MUncyoPKSnVruL3RkEqDzN5-AgvSiH5VQS5g@mail.gmail.com>
 <521F6FCD.3020500@mind.be>
Message-ID: <20130830094732.0ebb841f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 29 Aug 2013 17:59:09 +0200, Arnout Vandecappelle wrote:

> > Yes, I also considered that having the releases indicated in the graph
> > would be interesting. In fact, if we'd have these big moments shown in
> > the graph, the actual dates wouldn't really matter anymore and could
> > be hidden completely IMO.
> >
> > If you still have the info about when some of the big changes (like
> > new toolchain etc.) was done, we can definitely put that alongside the
> > release milestones.
> >
> > How to best store the milestones (in the database or in the graph.php
> > file itself), I'm not sure. They'll probably need to be manually
> > updated, but that could be done both in the database as in graph.php.
> > How to show these milestones in the graph is also not entirely clear.
> > I can't find a way to pass some custom x values to  pChart. One
> > solution is to manipulate the date array from php before passing it to
> > pChart. This way, if we have a map between date (as it appears in the
> > database) and event, we can replace the dates by the events, and make
> > all other strings empty. This should give the desired result I think.
> 
>   Ideally the horizontal axis should be based on git commit IDs instead 
> of build date, and the labels could be the tags.  And you could manually 
> add tags to the clone from which the commit IDs are extracted to indicate 
> those interesting points where toolchains are added etc. But that would 
> be a bit too much effort I guess :-)

Hum, yeah, I don't mind spending a bit of time on writing/maintaining a
few tools around QA for Buildroot, but I'd like to also keep some time
for real Buildroot development, and not be completely full with stupid
PHP development tasks :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
