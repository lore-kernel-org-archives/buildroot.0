From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Apr 2015 21:19:40 +0200
Subject: [Buildroot] a philosophical question about Config.in and
	"comment" directives
In-Reply-To: <55313266.9000600@mind.be> (Arnout Vandecappelle's message of
 "Fri, 17 Apr 2015 18:18:46 +0200")
References: <alpine.LFD.2.11.1504170840320.7665@localhost>
 <20150417150042.GA5271@free.fr> <55313266.9000600@mind.be>
Message-ID: <87a8y2vc8j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> that layout makes it far clearer that the entire option depends on
 >>> arm or you see *nothing* and, further, internally, the dependencies
 >>> in the comment list *only* those dependencies that the user will be
 >>> warned that they need if they want this selection.

 >  I completely agree.

Me too.

 >> So yes, you are right _on principle_. But we're not gonna change that
 >> policy, and we'll continue to require new packages to conform to it.

 >  We _could_ change the policy and just require new packages to conform to the
 > new policy. We do that regularly (cfr. patch naming, BR2_ prefix, ...).

 >  That said, I don't think the current situation is bad enough to
 > warrant such a change.

No indeed. I wouldn't mind new patches doing it like this, but I don't
want to se the churn to change our ~1500 existing packages to it.

-- 
Bye, Peter Korsgaard
