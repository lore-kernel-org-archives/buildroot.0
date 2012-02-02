From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Feb 2012 15:58:21 +0100
Subject: [Buildroot] [git commit] lpc32xx: Add CDL to the available
	bootloaders
In-Reply-To: <1328190266.29008.5.camel@emblysd024.adetel.com> (Alexandre
 Belloni's message of "Thu, 02 Feb 2012 14:44:26 +0100")
References: <20120201224701.8F35E90979@busybox.osuosl.org>
 <1328190266.29008.5.camel@emblysd024.adetel.com>
Message-ID: <87vcnp9t9u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <abelloni@adeneo-embedded.com> writes:

 Alexandre> Hi,

 Alexandre> It seems that somehow the CR '\r' characters have been
 Alexandre> stripped from the end of the lines of the patches. Original
 Alexandre> file are DOS formatted and the patches will then not apply.

Sigh, what a messy source. Your new patches seem to be identical to the
ones I originally applied (minus the descriptions), so that didn't
work. I also tried manually adding the CR's but patch seem to ignore
them :/

So instead I've added a post-extract hook to convert the affected files
to dos newlines.

-- 
Bye, Peter Korsgaard
