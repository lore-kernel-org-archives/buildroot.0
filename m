From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Feb 2011 12:35:04 +0100
Subject: [Buildroot] [git commit master 1/1] makedevs: fix cases where
	(start != 0)
In-Reply-To: <AANLkTi=EH1gbpx_NrRJC8NGCZ+APdJr9j6VVr_aa4HND@mail.gmail.com>
	("Daniel =?utf-8?Q?Nystr=C3=B6m=22's?= message of "Thu, 24 Feb 2011
	11:10:36 +0100")
References: <20110223224020.3D7678F626@busybox.osuosl.org>
	<AANLkTi=EH1gbpx_NrRJC8NGCZ+APdJr9j6VVr_aa4HND@mail.gmail.com>
Message-ID: <87tyftr7h3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Nystr?m <daniel.nystrom@timeterminal.se> writes:

 Daniel> 2011/2/23 Peter Korsgaard <jacmet@sunsite.dk>:
 >> ---
 >> ?CHANGES ? ? ? ? ? ? ? ? ? ? | ? ?9 +++++----
 >> ?package/makedevs/makedevs.c | ? 18 +++++++++++++-----
 >> ?2 files changed, 18 insertions(+), 9 deletions(-)
 >> 

 Daniel> Please, Peter, split actual code patch and CHANGES modification
 Daniel> in individual commits. Else it will break backporting through
 Daniel> git cherry-pick, and even future backporting on arbitrary
 Daniel> forks.

Sorry, forgot this time. Will try to remember.

-- 
Bye, Peter Korsgaard
