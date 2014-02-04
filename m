From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 11:25:39 +0100
Subject: [Buildroot] [PATCH 1/3] gnupg: depend on libiconv if appropriate
In-Reply-To: <52F0BCEC.6000905@mind.be> (Arnout Vandecappelle's message of
 "Tue, 04 Feb 2014 11:11:56 +0100")
References: <BLU0-SMTP112B1A733C43DA19ABF8DF9D9CE0@phx.gbl>
 <52F0BA01.5020806@mind.be> <52F0BCEC.6000905@mind.be>
Message-ID: <878utrdvj0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/02/14 10:59, Arnout Vandecappelle wrote:
 >> On 30/12/13 18:57, Bernd Kuhls wrote:
 >>> 
 >>> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 >> 
 >> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >> 
 >> Ideally, the explanation that you put in the follow-up message should be
 >> in the commit log, but OK.

 >  Actually, Bernd, to make our life easier, could you repost your
 > iconv-related patches (including the one in xorg) with the following inj
 > the commit message:

 > If iconv is built before this package, this package will link against it;
 > if it is built after this package, it will not be linked against it. To
 > make the build reproducible, make sure that iconv is always built before
 > this package.

True. I already applied the gnupg patch (but didn't push it), so I've
adjusted the commit message to match.

Bernd, could you resend the other patches with that commit message -
Thanks.

-- 
Bye, Peter Korsgaard
