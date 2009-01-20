From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 12:29:22 +0100
Subject: [Buildroot] Status of "mplayer" in buildroot
In-Reply-To: <AD5651DC396F4490BF04E1FEA1DFE9CA@aeglos> (Ulf Samuelsson's
	message of "Tue\, 20 Jan 2009 12\:00\:40 +0100")
References: <1232395188.4539.20.camel@elrond.atmel.com>
	<87ljt6xqy3.fsf@macbook.be.48ers.dk>
	<AD5651DC396F4490BF04E1FEA1DFE9CA@aeglos>
Message-ID: <87fxjew6zx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Wouldn't -rc2 be such a version?
 >> 

 Ulf> "-rc2" is almost as old as "-rc1" and this will not be an update to a
 Ulf> "release".

Well, it's still one year newer than -rc1, and afaik the closest we
have to a release from upstream.

 Ulf> The project only supports svn/git and expects people to download
 Ulf> the latest svn which may or may not break, so I think
 Ulf> our only alternative is to select the latest version, test that
 Ulf> and stay with that until we are forced to switch or decide
 Ulf> we want extra functionality.

Sure, let's do that if needed - But after the release and once HcE
get's his avr32 work integreated.

 Ulf> If the mplayer builds with HCE's patch, then there is no problem
 Ulf> keeping this for the release.

With my patches it does (atleast on powerpc), and according to HcE on
avr32 as well.

Could you give arm a try?

-- 
Bye, Peter Korsgaard
