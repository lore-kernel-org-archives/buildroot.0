From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 21:25:38 +0100
Subject: [Buildroot] [PATCH] distcc: deprecate package,
	only useful for development
In-Reply-To: <1393093797-12770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 22 Feb 2014 19:29:57 +0100")
References: <1393093797-12770-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877g8muc71.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since quite a while, we have deprecated, and then removed the support
 > to build a compiler on the target. Therefore, having a distcc package
 > for the package is quite useless, and this patch consequently marks it
 > as deprecated so it can be removed in a future version of Buildroot.

 > Fixes:

 >   http://autobuild.buildroot.net/results/16b/16be2138c8e5ba785fa2ad55b478dcd1b6fb5123/

It doesn't really fix the error, but ok.

Committed, thanks.

-- 
Bye, Peter Korsgaard
