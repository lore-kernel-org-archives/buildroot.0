From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 12:10:57 -0800
Subject: [Buildroot] [PATCH for-2012.11 0/5] Introduce errors for legacy
	API
In-Reply-To: <50AF8F3B.9090504@mind.be> (Arnout Vandecappelle's message of
 "Fri, 23 Nov 2012 15:59:07 +0100")
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
 <87wqxn5cu6.fsf@dell.be.48ers.dk> <50AF8F3B.9090504@mind.be>
Message-ID: <877gp2am26.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  The problem with warnings is that we produce so much output
 Arnout> that they'll just be hidden. They would make sense if an error
 Arnout> follows soon after. But in all likelihood, if an error follows,
 Arnout> it will be much further down.

 Arnout>  [snip]

 Arnout>  So, is there still anything that I should change?

I'm still not 100% happy with it, but I think this is the best we can do
for 2012.11, so I've committed the series, thanks!

-- 
Bye, Peter Korsgaard
