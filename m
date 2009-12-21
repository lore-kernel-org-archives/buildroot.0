From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Dec 2009 21:06:08 +0100
Subject: [Buildroot] External toolchain: crosstool-NG instead of
	buildroot?
In-Reply-To: <200912202237.58730.yann.morin.1998@anciens.enib.fr> (Yann
	E. MORIN's message of "Sun, 20 Dec 2009 22:37:58 +0100")
References: <hgfudc$e2$1@ger.gmane.org> <877hsh1l3i.fsf@macbook.be.48ers.dk>
	<200912202237.58730.yann.morin.1998@anciens.enib.fr>
Message-ID: <871vioytvz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

Hi,

 Yann> Hello Peter, and All!
 Yann> On Sunday 20 December 2009 20:50:09 Peter Korsgaard wrote:
 >> we had some discussion about working
 >> closer together with the crosstool-NG people, E.G. long term perhaps
 >> getting rid of toolchain building in BR, and simply use crosstool-NG for
 >> it.

 Yann> As you mentioned the subject, I think we should prepare both
 Yann> projects so crosstool-NG offers all that buildroot needs, and
 Yann> maybe tweak a few things in buildroot to efficiently use
 Yann> crostool-NG.

Yes definately - Yann, I'm really sorry that I haven't gotten back to
you on your mail from ELCE - Things have been kind of crazy here, but
now holidays are coming up.

 Yann> The plans for crosstool-NG are a ~4-month release cycle, as 3
 Yann> months is too short for me alone to handle. I think I can adapt
 Yann> the release cycle to more closely follow buildroot. In fact, I
 Yann> think that, to be efficient, crosstool-NG should be released one
 Yann> month ahead of buildroot, so that potential bugs can be fixed and
 Yann> a bug-fix release can be made just before the buildroot
 Yann> release. That way, buildroot can rely on an as-stable-as-
 Yann> possible release. Next crosstool-NG release is due for late
 Yann> January, so that should be a match for the next buildroot
 Yann> (planned February, I guess).

Yes, that sounds good. Why is a 3 month release schedule significantly
more work than a 4 month one? It should just mean less new development
done per release.

 Yann> Apart form that, we could build upon the results of the BR
 Yann> developper day.  Should I repost my summary to this list?

Yes please do.

Talking about developers day, Thomas and me are trying to arrange
another dev day after FOSDEM (February 8) - Anyone interested?

-- 
Bye, Peter Korsgaard
