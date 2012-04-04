From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Apr 2012 22:07:34 +0200
Subject: [Buildroot] [PATCH 1/1] lttng-libust: rename patch so that it
	is taken into account
In-Reply-To: <201203282226.09646.arnout@mind.be> (Arnout Vandecappelle's
 message of "Wed, 28 Mar 2012 22:26:08 +0200")
References: <cover.1332801197.git.thomas.petazzoni@free-electrons.com>
 <b3435944bbaf51566d808dc51aea2e2715143dbd.1332801197.git.thomas.petazzoni@free-electrons.com>
 <201203282226.09646.arnout@mind.be>
Message-ID: <87r4w3tg55.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Tuesday 27 March 2012 00:33:21 Thomas Petazzoni wrote:
 >> The package/lttng-libust/ contains a patch prefixed with
 >> lttng-libust-1.9.2, so the other patch simply prefixed with
 >> lttng-libust does not get applied. Rename the second patch properly.

 Arnout>  I thought we agreed to avoid versioned patches as much as possible, no?
 Arnout> So this should rather be a rename of 
 Arnout> lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch

I agree. I'll rename it.

-- 
Bye, Peter Korsgaard
