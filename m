From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 May 2015 10:44:42 +0200
Subject: [Buildroot] [PATCH] network-manager: remove redundant
	dependencies
In-Reply-To: <1430555918-15398-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 2 May 2015 10:38:38 +0200")
References: <20150502082317.22A878073F@busybox.osuosl.org>
 <1430555918-15398-1-git-send-email-arnout@mind.be>
Message-ID: <87pp6jtll1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Now network-manager depends on glibc, there is no need anymore for the
 > wchar and threads dependencies (implied by glibc). So remove them.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

True, I kept them as documentation in case NM in the future would again
become available on !glibc.

But ok, we still have that information in the git history, so committed
- Thanks.

-- 
Bye, Peter Korsgaard
