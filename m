From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 08:33:50 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/pkg-infra
In-Reply-To: <87fwjeo84d.fsf@macbook.be.48ers.dk>
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
 <87sjnfni6h.fsf@macbook.be.48ers.dk>
 <20110930065130.142d51bd@skate>
 <87fwjeo84d.fsf@macbook.be.48ers.dk>
Message-ID: <20110930083350.541d2ce8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 30 Sep 2011 08:29:54 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Sorry, I was too quick. I've dropped patch 9 (Makefile.package.in: Pass
> non-prefixed name as argument to GENTARGETS_INNER) as that broke the
> build in various odd ways, like host packages skipping their build
> step. I noticed that you haven't signed off on that commit, did you test
> it?

Yes, I did test the whole patchset, maybe I missed something. The
reason why there is no Signed-off-by is because I always forget to use
git am -s. The patch has even been heavily modified by me since it was
written by "Quotient Remainder".

> With this dropped I had to remove the fakeroot patch as well.

Ok, I will rework patch 9 and 15 in a separate branch, do some more
testing and repost.

Thanks, and sorry for the mess (I told you there would be some
breakage!).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
