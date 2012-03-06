From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Mar 2012 22:21:32 +0100
Subject: [Buildroot] [PATCH] Fix microperl
In-Reply-To: <1330895345-16705-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 4 Mar 2012 22:09:05 +0100")
References: <1330895345-16705-1-git-send-email-arnout@mind.be>
Message-ID: <871up5o277.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> It misses -lm when compiling miniperl
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

 Arnout> ---
 Arnout> This is actually a quite old perl version, and it's not even converted
 Arnout> to GENTARGETS.  Should we deprecate it?

Well, I think getting rid of it would be a pity, but I don't personally
use perl so if nobody else is using it? Gustavoz?

-- 
Bye, Peter Korsgaard
