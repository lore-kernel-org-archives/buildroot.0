From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jun 2014 08:36:31 +0200
Subject: [Buildroot] [PATCH for next] package/tzdata: only compile the
	zoneinfo once
In-Reply-To: <1400797307-6741-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 23 May 2014 00:21:47 +0200")
References: <1400797307-6741-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87tx83zukw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > We already compile the zoneinfo once for the host, so there is
 > no need to recompile it for the target, we can just re-use the
 > host files.

 > This has no impact on tz (the uClibc counterpart of tzdata), since
 > it already made use of the host files anyway.

 > This means we no longer need to extract the target variant of
 > tzdata, too.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
