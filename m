From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 22 Jul 2011 16:33:36 +0100
Subject: [Buildroot] [PATCH] dropbear: Create destination directories
 before use in install stage.
In-Reply-To: <87sjpyy2fc.fsf@macbook.be.48ers.dk>
References: <1311332746-8143-1-git-send-email-quotientvremainder@gmail.com>
 <87sjpyy2fc.fsf@macbook.be.48ers.dk>
Message-ID: <1311348822.2189.78.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Fri, 2011-07-22 at 13:34 +0200, Peter Korsgaard wrote:
>  Quotient> Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>
> 
> Real name please.

I accept fully that as the lead developer on BR you're free to choose
and enforce any set of rules as you see fit.  However, contributions
under pseudonyms have long been a part of Internet culture.  Isn't that
name just as valid as any other less suspicious-looking (but equally
unverified) names that are on any other patches?
Will you insist on this real name policy?

> I would prefer to use install -D like elsewhere to ensure usr/sbin is
> created, and then move the mkdir -p just above the _TARGET_BINS loop.

OK, v2 on the way.
