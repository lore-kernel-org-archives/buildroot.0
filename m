From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 12:27:26 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAEAJfAnZs_5kXpjD_qUn0xHU-H7A1O-0p6yR+tnuVLvKMsEPQ@mail.gmail.com>
 ("Ezequiel =?utf-8?Q?Garc=C3=ADa=22's?= message of "Mon, 11 Nov 2013
 09:25:03 -0200")
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
 <CAAEAJfAnZs_5kXpjD_qUn0xHU-H7A1O-0p6yR+tnuVLvKMsEPQ@mail.gmail.com>
Message-ID: <87ob5r6uw1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garc?a <ezequiel@vanguardiasur.com.ar> writes:

Hi,

>> NIOS2 support missing in libnspr. Ezequiel, can you look into this?
>> Normally, adding an architecture support in libnspr is really easy, so
>> adding a patch to libnspr should be feasible.
>> 

> Right. Would you accept a "builds-only" patch for it?
> I'm not familiar with libnspr and it seems it's only loosely used
> through libnss in BR.

Yes. Even if you cannot do any runtime tests, it will most likely be OK
and is in any case a step forward compared to a build failure.

-- 
Bye, Peter Korsgaard
