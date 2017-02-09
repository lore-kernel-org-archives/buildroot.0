From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Feb 2017 14:57:13 +0100
Subject: [Buildroot] [PATCH] ed: security bump to version 1.14.1
In-Reply-To: <6796986f067dee849f76751df0c57bbf28d30492.1486647150.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 9 Feb 2017 15:32:30 +0200")
References: <6796986f067dee849f76751df0c57bbf28d30492.1486647150.git.baruch@tkos.co.il>
Message-ID: <878tpfo4au.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2017-5357: crash with some malformed commands.
 > Upstream now provides .tar.lz archive. Add the necessary extract command.

Committed, thanks.

We now have two packages using .tar.lz (ed and ocrad), so perhaps we
should add support for it in pkg-utils.mk like we do for xzcat.


-- 
Bye, Peter Korsgaard
