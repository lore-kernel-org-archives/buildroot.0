From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Mar 2021 10:04:33 +0200
Subject: [Buildroot] [PATCH 0/5] legacy: drop old options (branch
 yem/drop-old-legacy)
In-Reply-To: <378607bf-548e-feec-a7b9-182bb6c50989@mind.be> (Arnout
 Vandecappelle's message of "Mon, 29 Mar 2021 08:59:00 +0200")
References: <cover.1616878389.git.yann.morin.1998@free.fr>
 <20210328212402.696e0207@windsurf.home> <20210328195205.GQ24043@scaer>
 <378607bf-548e-feec-a7b9-182bb6c50989@mind.be>
Message-ID: <877dlqgzce.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Absolutely. I recently did an update from 2018.02 to 2021.02 for a user whom I
 > think is relatively conscientious about updating. So two years is definitely too
 > short.

:/

 >  (As an aside: there's a good reason to not update too often, and that is that
 > some projects sometimes dramatically break compatibility. In my case, it's the
 > Phalcon PHP package - it took me three days to fix all the breakage in the
 > custom PHP scripts using that package, and I'm still not sure it's all good.)

I would argue that this is exactly a reason for updating MORE often than
less, to make the delta smaller and easier to debug. Doing it often
makes you also more inclined to automate it and write some decent
regression tests.

The best solution is naturally to not build your product on top of such
moving targets in the first place, but you don't always have to option
to do so.

 >>> Since the maintenance cost of those legacy options is essentially zero,
 >>> I am wondering if we really need to drop them. Should we change the
 >>> rule and drop the ones that are 5 years old for example ?

 >  Indeed. I always thought that the idea was that we would keep the legacy around
 > until there was some reason to remove them, but that we'd advertise some fixed
 > period to make sure people are not surprised about the removal.

I am also fine with 5 years (or even more, as long as they don't get in
the way).

-- 
Bye, Peter Korsgaard
