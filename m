From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:29:03 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <8b127902-0268-8307-70da-065362773da9@mind.be> (Arnout
 Vandecappelle's message of "Sun, 23 Apr 2017 22:55:24 +0200")
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
 <20170420092015.3b2f7fbd@free-electrons.com>
 <87pog3ypb1.fsf@dell.be.48ers.dk>
 <8b127902-0268-8307-70da-065362773da9@mind.be>
Message-ID: <87o9vlvc3k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Of course, we can also choose to apply solution 3 only to the situation where 1
 > doesn't work because of circular dependencies.

 >  I can't say which solution is the best. I therefore tend to say: stick to what
 > we have, and find a workaround if needed. In other words, apply this patch, but
 > don't do it for other packages until required.

I'm in the same boat - So agreed!

-- 
Bye, Peter Korsgaard
