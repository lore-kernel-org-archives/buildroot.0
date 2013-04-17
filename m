From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Apr 2013 21:51:46 +0200
Subject: [Buildroot] [PATCH] busybox: don't disable static option
In-Reply-To: <516BC3BC.5040100@fh-kl.de> (Patrick Ziegler's message of "Mon,
 15 Apr 2013 11:09:16 +0200")
References: <516BC3BC.5040100@fh-kl.de>
Message-ID: <87vc7lhr59.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Ziegler <patrick.ziegler@fh-kl.de> writes:

 Patrick> Don't change the busybox STATIC option if buildroots
 Patrick> PREFER_STATIC_LIB option is not set. Not to prefer static
 Patrick> linking doesn't imply prefer dynamic linking for all packages.

Committed, thanks.

-- 
Bye, Peter Korsgaard
