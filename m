From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Jun 2008 19:32:01 +0200
Subject: [Buildroot] Still no answer for a contribution made in March
In-Reply-To: <0cd501c8cca5$1be1eb80$0c0514ac@atmel.com> (Ulf Samuelsson's
	message of "Thu\, 12 Jun 2008 17\:55\:29 +0200")
References: <20080611161156.33737116@crazy>
	<46a136670806110808x737929a4red33f32c593ae6e2@mail.gmail.com>
	<20080611154121.GI3795@mx.loc> <20080612095933.25f3345e@crazy>
	<871w33doy1.fsf@macbook.be.48ers.dk>
	<0c2401c8cc99$baad47c0$0c0514ac@atmel.com>
	<87hcby8xmw.fsf@macbook.be.48ers.dk>
	<0cd501c8cca5$1be1eb80$0c0514ac@atmel.com>
Message-ID: <87ej725zla.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

<stripped cc list to please mailman>

Hi,

 >> >> Agree - And lack of testing before stuff gets checked in. The deeper
 >> >> issue is that we don't do releases I guess, so there's a tension
 >> >> between doing development, and having something stable for actual use.
 >> >> 
 >> 
 Ulf> Maybe we should start?
 >> 
 >> Fine by me, but that means we'll need to spend time stabilizing the
 >> tree and make sure the packages actually work (on multiple archs). Do
 >> you have time to help on this?

 Ulf> In August I think there will be time for implementation, 
 Ulf> but we could discuss the underlying architecture before that.

Yes.

 Ulf> The tarball mirror server is critical.
 Ulf> I have been trying to convince my colleagues to set something up,
 Ulf> and there is some progress, since some packages are now at
 Ulf> http://www.atmel.no/buildroot/source/mirror/
 Ulf> and this could be used for testing the mirror function.

The support is there already (BR2_PRIMARY_SITE), but I would strongly
prefer to host it on uclibc.org instead.

Mike, would a package mirror on the uclibc.org machine be possible
(2-3GB)?

 Ulf> Anyone volunteering for implementing a wget script?

It's there already (for the new-style Makefile.autotools.in packages).

-- 
Bye, Peter Korsgaard
