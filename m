From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Sep 2012 22:56:40 +0200
Subject: [Buildroot] [PATCH] pkg-infra: warn about use of deprecated
	GENTARGETS
In-Reply-To: <1346200620-11644-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 29 Aug 2012 02:37:00 +0200")
References: <1346200620-11644-1-git-send-email-arnout@mind.be>
Message-ID: <87y5ko429j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> With the replacement of GENTARGETS by package-generic, there is a risk
 Arnout> that local packages don't work anymore without any indication of what
 Arnout> is wrong.  Therefore, generate an error message if the GENTARGETS,
 Arnout> AUTOTARGETS or CMAKETARGETS macro is still used.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Commmitted, thanks.

-- 
Bye, Peter Korsgaard
