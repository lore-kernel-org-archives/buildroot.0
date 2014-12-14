From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 19:54:53 +0100
Subject: [Buildroot] [PATCH] package/w_scan: needs headers >= 3.7
In-Reply-To: <1418578103-4691-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 14 Dec 2014 18:28:23 +0100")
References: <1418578103-4691-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87h9wynjsy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > w_scan uses FEC_2_5, introduced in Linux 3.7.
 > Also fix the comment, that was stuck to headers 3.0 when we were
 > requesting headers >= 3.3.

 > Fixes:
 >     http://autobuild.buildroot.org/results/bb9/bb97bff1bf7774ebd43ba2107d84520538e530cf/
 >     http://autobuild.buildroot.org/results/9c2/9c28dcaf3d3bb65977d565e4fbbc25d51d45ac41/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
