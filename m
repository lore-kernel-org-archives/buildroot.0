From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Sep 2016 22:10:22 +0200
Subject: [Buildroot] RTAI math module compilation
In-Reply-To: <78c4ab72-52be-571c-e81a-a0f78c1e2e7f@mind.be> (Arnout
 Vandecappelle's message of "Thu, 15 Sep 2016 23:21:58 +0200")
References: <CAEqQue108OTCsmAejX1sR6q8HL2zCj7jXtaB927b=kHo=UQTrA@mail.gmail.com>
 <78c4ab72-52be-571c-e81a-a0f78c1e2e7f@mind.be>
Message-ID: <87vaxi2zip.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Perhaps we should remove RTAI. The most recent patch for x86 is 3.8, and the
 > most recent patch for ppc is 2.6.29... Oh, and there is a new version 5.0-test2
 > released in May that goes up to 4.1 for x86 (and drops ppc).

So x86 is the only supported arch? I see that test2 isn't even announced
on rtai.org :/

I personally don't have any issues removing RTAI if it doesn't get
updated / nobody uses it.

If you DO use it, please speak up.

-- 
Bye, Peter Korsgaard
