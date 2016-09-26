From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Sep 2016 22:19:25 +0200
Subject: [Buildroot] [PATCH] i2c-tools: install devt headers to staging
	dir
In-Reply-To: <0b8205ef-ee98-a652-455c-f4717b294939@mind.be> (Arnout
 Vandecappelle's message of "Fri, 23 Sep 2016 23:18:07 +0200")
References: <1474639604-23866-1-git-send-email-julien.boibessot@free.fr>
 <0b8205ef-ee98-a652-455c-f4717b294939@mind.be>
Message-ID: <87mviu2z3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Also, I would prefer to use the install target. The manual install was there
 > from the very first commit in 2008, I don't think it's still relevant. Peter?
 > Anyway, for staging the install target can definitely be used.

Sorry, I don't remember. I *THINK* it installed a number of unneeded
stuff.

Changing to make install is fine by me if it nowadays does something sensible.

-- 
Bye, Peter Korsgaard
