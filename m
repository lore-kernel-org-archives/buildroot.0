From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Jul 2011 08:14:58 +0200
Subject: [Buildroot] [PATCH] Fix colon location in S01logging script
In-Reply-To: <201107121745.23113.hartleys@visionengravers.com> (H. Hartley
 Sweeten's message of "Tue, 12 Jul 2011 17:45:22 -0700")
References: <201107121745.23113.hartleys@visionengravers.com>
Message-ID: <8739iahfkt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> The S01logging script currently displays the start/stop messages like this:
 H> Start logging :OK

 H> The normal form for these messages is:

 H> Start logging: OK

Committed, thanks.

-- 
Bye, Peter Korsgaard
