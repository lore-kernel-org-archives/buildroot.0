From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 09:34:56 +0200
Subject: [Buildroot] [PATCH] Add a config option for gcc tls support,
	rather than disabling it blindly
In-Reply-To: <1253489618-24753-1-git-send-email-austinf@cetoncorp.com> (Austin
	Foxley's message of "Sun\, 20 Sep 2009 16\:33\:38 -0700")
References: <1253489618-24753-1-git-send-email-austinf@cetoncorp.com>
Message-ID: <87hbuuru5b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Austin" == Austin Foxley <austinf@cetoncorp.com> writes:

 Austin> Defaulted to yes, but blocked it from gcc 4.4.x since the disable was
 Austin> originally added because of problems with its c++ support reportedly.

Committed, thanks.

-- 
Bye, Peter Korsgaard
