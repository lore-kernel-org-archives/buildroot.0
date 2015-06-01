From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2015 21:19:46 +0200
Subject: [Buildroot] Buildroot 2015.05 released
In-Reply-To: <556CAD93.8090906@mind.be> (Arnout Vandecappelle's message of
 "Mon, 01 Jun 2015 21:08:03 +0200")
References: <87mw0kv3fx.fsf@dell.be.48ers.dk> <556CAD93.8090906@mind.be>
Message-ID: <87iob7utgt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 05/31/15 23:32, Peter Korsgaard wrote:
 > [snip]
 >> And a special thanks to our patch reviewers:
 >> 
 >> git log 2015.02.. | grep -Ei '(reviewed|acked)-by:' | \
 >> sed 's/.*by: //' | sort | uniq -c | sort -n -r

 >  For the future, perhaps also include the testers:

 > git log 2015.02..2015.05 | grep -i 'tested-by:' | \
 >     sed 's/.*by: //' | sort | uniq -c | sort -n -r

Yes, I'll do that from now on. Feel free to remind me close to the
2015.08 release in case I forget :P


-- 
Peter Korsgaard 
