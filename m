From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Jan 2011 21:28:34 +0100
Subject: [Buildroot] [PATCH 03/13] procps: convert to gentargets and
	bump to 3.2.8
In-Reply-To: <4D349C76.5000503@zacarias.com.ar> (Gustavo Zacarias's message of
	"Mon, 17 Jan 2011 16:45:58 -0300")
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
	<1294431182-27793-3-git-send-email-gustavo@zacarias.com.ar>
	<87r5cbnwrb.fsf@macbook.be.48ers.dk>
	<4D349C76.5000503@zacarias.com.ar>
Message-ID: <87tyh7l1fx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 01/17/11 16:41, Peter Korsgaard wrote:
 >> Please add authorship / signed-off-by to patches. According to the name,
 >> this patch is to fix an issue with make 3.82, but from reading the
 >> description and fix, it doesn't look version dependent?

 Gustavo> Author unknown, nixed from gentoo.
 Gustavo> I think i shouldn't sign off on something i didn't write right?

No, put putting the Gentoo URL in it would be very good for
tracability. Is it a make 3.82 only thing, or does it also fail with
3.81?
 
-- 
Bye, Peter Korsgaard
