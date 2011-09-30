From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Sep 2011 08:29:54 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/pkg-infra
In-Reply-To: <20110930065130.142d51bd@skate> (Thomas Petazzoni's message of
 "Fri, 30 Sep 2011 06:51:30 +0200")
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
 <87sjnfni6h.fsf@macbook.be.48ers.dk> <20110930065130.142d51bd@skate>
Message-ID: <87fwjeo84d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Committed series with minor fixes like discussed on IRC, thanks!

 Thomas> Thanks! People, please test the latest Git and see if nothing
 Thomas> breaks.  Some changes are fairly sensitive, and there might be
 Thomas> some breakage. Do not hesitate to report anything suspicious.

Sorry, I was too quick. I've dropped patch 9 (Makefile.package.in: Pass
non-prefixed name as argument to GENTARGETS_INNER) as that broke the
build in various odd ways, like host packages skipping their build
step. I noticed that you haven't signed off on that commit, did you test
it?

With this dropped I had to remove the fakeroot patch as well.

-- 
Bye, Peter Korsgaard
