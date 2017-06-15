From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:59:56 +0200
Subject: [Buildroot] [PATCH 0/8] Top-level Makefile fixes
In-Reply-To: <20170614221135.17470-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 15 Jun 2017 00:11:27 +0200")
References: <20170614221135.17470-1-arnout@mind.be>
Message-ID: <874lvhk1ur.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 >  I saw this StackOverflow question [1], to which Luca gave a satisfactory
 > answer, and noticed that this really shouldn't happen: when Buildroot
 > isn't configured and you type 'make toolchain', you should get an error
 > instead of "Nothing to be done.".

ENOURL?

 >  So I set out to fix that, one thing led to another, and here are 8
 > patches :-)

 >  As described in the last patch, there are in fact two different ways
 > to fix it. I already have a patch for the alternative so I can post it
 > if necessary.

Committed patch 1-7. I would like to think a bit more about patch 8 and
perhaps get feedback from others.

-- 
Bye, Peter Korsgaard
