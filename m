From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 20:59:28 +0100
Subject: [Buildroot] [PATCH] libelementary: depends on libethumb
In-Reply-To: <1357947928-10549-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 12 Jan 2013 00:45:28 +0100")
References: <1357947928-10549-1-git-send-email-arnout@mind.be>
Message-ID: <87mwwe6ulb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> This was exposed because I still had an old libethumb in my staging
 Arnout> directory so it was detected by configure, but because of the missing
 Arnout> dependency it was still the (incompatible) version from before the
 Arnout> 1.7.4 bump.

Committed, thanks.

-- 
Bye, Peter Korsgaard
