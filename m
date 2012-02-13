From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Feb 2012 09:25:01 +0100
Subject: [Buildroot] [RFC] progress indicator
In-Reply-To: <4F38C486.5030208@visionsystems.de> (Yegor Yefremov's message of
 "Mon, 13 Feb 2012 09:06:30 +0100")
References: <CAGm1_kt5qPOB2fpWNRREejgp5jMhsM+o0Dq5Po3LHMpySecEjw@mail.gmail.com>
 <201202102355.55858.arnout@mind.be>
 <4F38C486.5030208@visionsystems.de>
Message-ID: <8762fbywbm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 Yegor> I fear it is inevitable. But if someone has lots of free time,
 Yegor> it would be a nice feature. Especially on slow machines it is
 Yegor> very nice to know how long will take to build.

I don't have a problem with adding something like that if it isn't too
intrusive. We once had a RFC patch which changed the MESSAGE macro to
also output to the xterm title. I guess we could estimate the progress
by counting the number of times E.G. the extract target has been run
divided by $(words $(TARGETS)).

-- 
Bye, Peter Korsgaard
