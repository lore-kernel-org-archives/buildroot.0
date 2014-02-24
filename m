From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Feb 2014 09:04:27 +0100
Subject: [Buildroot] [PATCH] libsecret: not available on AVR32,
	compiler error
In-Reply-To: <1393197361-13223-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 24 Feb 2014 00:16:01 +0100")
References: <1393197361-13223-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ob1xlywk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > libsecret does built on AVR32 due an internal compiler error, and
 > since it's unlikely that gcc will ever be upgraded on AVR32, we simply
 > mark this package as not available. The only reverse dependency of
 > libsecret is webkit, which already cannot be selected on AVR32.

 > Fixes:

 >   http://autobuild.buildroot.org/results/2d4/2d41f97378f06d0f3922e078ec0d02549690d4c1/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
