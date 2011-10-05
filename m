From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 19:10:38 +0200
Subject: [Buildroot] [PATCH] pkg-stats: cnt should start with 0
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DCFE857@AUSP01VMBX24.collaborationhost.net>
 (H. Hartley Sweeten's message of "Wed, 5 Oct 2011 11:47:54 -0500")
References: <ADE657CA350FB648AAC2C43247A983F001F39DCFE857@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87ipo3pdo1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> The package count, cnt, should start with an initial value of 0.  It
 H> is incremented as each package *.mk file is checked.  Starting with a
 H> value of 1 makes the first ID = 2 and results in the TOTAL being off
 H> by 1.

Committed, thanks.

-- 
Bye, Peter Korsgaard
