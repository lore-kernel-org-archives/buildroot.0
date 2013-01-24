From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Jan 2013 21:09:05 +0100
Subject: [Buildroot] [PATCH] gdb: Add support for gdb 7.5.1 and make it
	the default.
In-Reply-To: <510183DF.2060004@mind.be> (Arnout Vandecappelle's message of
 "Thu, 24 Jan 2013 19:56:31 +0100")
References: <CAFbHwiQ2bqy9HMrWHLan-M3Oy1mFBd2QOkQMoVU=NiAKkd4cQw@mail.gmail.com>
 <510183DF.2060004@mind.be>
Message-ID: <87ehha1gym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 01/24/13 12:33, Will Newton wrote:
 >> prompt "GDB debugger Version"
 >> default BR2_GDB_VERSION_6_6 if BR2_bfin
 >> default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32

 Arnout>  Not related but I see it now: does gdb 7.* actually work for avr32?
 Arnout> If so, why do we keep this old version around?

I believe it doesn't, but I've never tried. All the 7.x versions
shouldn't be selectable for avr32 (unless I'm wrong and they do work).

-- 
Bye, Peter Korsgaard
