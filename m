From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Dec 2011 09:41:50 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <20111214093123.17a1d8da@skate> (Thomas Petazzoni's message of
 "Wed, 14 Dec 2011 09:31:23 +0100")
References: <4EE1CB14.9010802@free.fr>
 <CAHUNapQTUqg5Vo4c57Yg4OqG+FL6trcjZBPJsEzfE0xGc=cdvQ@mail.gmail.com>
 <87d3bttw2v.fsf@macbook.be.48ers.dk>
 <201112140808.49826.arnout@mind.be> <20111214093123.17a1d8da@skate>
Message-ID: <87mxavmto1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Wed, 14 Dec 2011 08:08:49 +0100,
 Thomas> Arnout Vandecappelle <arnout@mind.be> a ?crit :

 >> Or better yet, to use our own and prime it with all the generic
 >> configure variables.  That may bring down the huge amount of time
 >> spent in running configure scripts...

 Thomas> We tried to share the configure variables in the past by sharing the
 Thomas> configure cache between packages and this has proven to be very
 Thomas> unreliable. However, sharing some really generic variables that are
 Thomas> known to be understood by all configure scripts in the same way, is a
 Thomas> possibility.

We already do that with TARGET_CONFIGURE_ARGS. Putting those in a
config.site would afaik be equivalent, but arguably somewhat cleaner.

-- 
Bye, Peter Korsgaard
