From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Mar 2017 00:38:40 +0100
Subject: [Buildroot] [PATCH] xlib_libXv: correct license type
In-Reply-To: <87d1dfo7j1.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 17 Mar 2017 23:36:18 +0100")
References: <20170316153146.21715-1-peter@korsgaard.com>
 <87d1dfo7j1.fsf@dell.be.48ers.dk>
Message-ID: <874lyrmq2n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> The license is actually closer to ICS than MIT, E.G.:
 >> https://opensource.org/licenses/ISC
 >> vs
 >> https://opensource.org/licenses/MIT

 >> From COPYING:
 >> Permission to use, copy, modify, and distribute this software and its
 >> documentation for any purpose and without fee is hereby granted,
 >> provided that the above copyright notice appear in all copies and that
 >> both that copyright notice and this permission notice appear in
 >> supporting documentation, and that the names of Digital or MIT not be
 >> used in advertising or publicity pertaining to distribution of the
 >> software without specific, written prior permission.

 >> E.G.  this is the normal ICS text which has been extended with a BSD-3c
 >> style advertisinc clause.  Both are permissive licenses, but it is more
 >> correct to call it ICS-like.

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed after fixing up the s/ICS/ISC/ mixup and adding a note about
 > the OpenBSD license template as pointed out by Rahul, thanks!

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
