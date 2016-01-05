From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2016 22:25:31 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/sp-oops-extract: consolidate
	use of stdint types
In-Reply-To: <1451939038-32365-1-git-send-email-rdkehn@yahoo.com> (Doug Kehn's
 message of "Mon, 4 Jan 2016 14:23:58 -0600")
References: <1451939038-32365-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <87r3hvhg6s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Doug" == Doug Kehn <rdkehn@yahoo.com> writes:

 > Change u_int*_t to uint*_t for compatibility with a larger number of C
 > libraries.

 > Fixes:
 > http://autobuild.buildroot.net/results/c649822aa129d56e5462a4887b13811340564453/

 > This patch has also been submitted upstream (ptxdist at pengutronix.de).

It is more about toolchains that C libraries as uint*_t is in C99, and
u_int*_t isn't - E.G.:

https://stackoverflow.com/questions/5090737/datatypes-used-in-c

Committed with the description extended a bit to explain this, thanks.

-- 
Bye, Peter Korsgaard
