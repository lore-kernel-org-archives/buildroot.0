From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 09:49:58 +0100
Subject: [Buildroot] libglibg2 fails
In-Reply-To: <1232091382.8094.40.camel@aeglos.sweden.atmel.com> (Ulf
	Samuelsson's message of "Fri\, 16 Jan 2009 08\:36\:22 +0100")
References: <1232091382.8094.40.camel@aeglos.sweden.atmel.com>
Message-ID: <87iqof7hzd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> When building libglib2 for both AVR32 and ARM I get the following:
 Ulf> ...
 Ulf> gconvert.c:55:2: error: 
 Ulf>    #error GNU libiconv not in use but included iconv.h is from libiconv
 Ulf> make[5]: *** [gconvert.lo] Fel 1
 Ulf> ...
 Ulf> make[1]: Leaving directory `<buildroot>/build_avr32/libglib2-2.19.4'
 Ulf> ...

 Ulf> Is there anyone capable of building libglib2?

I've built it several times around christmas for arm (v4l)

Haven't tried since, so it sounds like recent breakage.

-- 
Bye, Peter Korsgaard
