From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 21:48:15 +0200
Subject: [Buildroot] [PATCH] boost: Fix compilation of Boost.Variants
	move assignment
In-Reply-To: <1381523863-5285-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Fri, 11 Oct 2013 22:37:43 +0200")
References: <1381523863-5285-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87siw3prb4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Fix compilation of Boost.Variants move assignment for situations when one of the variant template classes has nothrow copy constructor and throwing move constructor (refs #8772)
 Luca> Fixes compilation error:

Committed, thanks.

-- 
Bye, Peter Korsgaard
