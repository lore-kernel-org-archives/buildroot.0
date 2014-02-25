From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 22:12:03 +0100
Subject: [Buildroot] [PATCH] ncftp: clarify the NCFTP_RUN_AUTOCONF hook.
In-Reply-To: <1393362107-21729-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 25 Feb 2014 22:01:47 +0100")
References: <1393362107-21729-1-git-send-email-arnout@mind.be>
Message-ID: <87d2iaj3rw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > When I saw this patch it took me a while to figure out how/why it worked,
 > so let's make life easier for the eventual version bumper to understand
 > what's going on here.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > For -next

We made the change on master, and this change is obviously (tm) safe, so
I've added it to master instead, thanks.

-- 
Bye, Peter Korsgaard
