From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jul 2013 07:46:31 +0200
Subject: [Buildroot] [PATCH] mongrel2: needs threads
In-Reply-To: <CAKcgs2y2BdqScXnRPcr1vLusRAu-tjKU04X7kuxEYD5ofe_BaQ@mail.gmail.com>
 (Gilles Talis's message of "Tue, 9 Jul 2013 19:38:08 -0700")
References: <CAKcgs2y2BdqScXnRPcr1vLusRAu-tjKU04X7kuxEYD5ofe_BaQ@mail.gmail.com>
Message-ID: <87fvvnge6g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> mongrel2 uses zeromq that needs threads
 Gilles> Fixes:
 Gilles> http://autobuild.buildroot.org/results/93d/
 Gilles> 93da58453e1ca0cc491170976cfbdeb8bee5c648

Committed, thanks.

Notice that your patch was quite badly mangled by your mailer, so I had
to fix it up manually. Please consider using git send-email in the
future.

-- 
Bye, Peter Korsgaard
