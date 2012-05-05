From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 14:56:51 +0200
Subject: [Buildroot] [PATCH 1/2] ocf-linux: new package
In-Reply-To: <5e88124f6b69d203ad230db954cd9d4e@zacarias.com.ar> (Gustavo
 Zacarias's message of "Sat, 05 May 2012 09:39:21 -0300")
References: <1336159393-17052-1-git-send-email-gustavo@zacarias.com.ar>
 <1336159393-17052-2-git-send-email-gustavo@zacarias.com.ar>
 <87wr4qde8n.fsf@macbook.be.48ers.dk>
 <5e88124f6b69d203ad230db954cd9d4e@zacarias.com.ar>
Message-ID: <87sjfedbvw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> Run-tested as low as 2.6.38.x
 Gustavo> Build-tested as low as 2.6.35.x
 Gustavo> I can give it a run-test on 2.6.35 maybe, depending on how lucky i am
 Gustavo> with my hardware crypto enabled test platforms.

So the 3.2.1 patch works with everything from 2.6.35..3.3? If that's the case, then I
think it's OK to alway use that one, but please add a comment explaining
why.

-- 
Bye, Peter Korsgaard
