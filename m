From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 May 2014 00:17:00 +0200
Subject: [Buildroot] [PATCH] build/sstrip: deprecate for 2014.05
In-Reply-To: <1400622842-30173-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 20 May 2014 23:54:02 +0200")
References: <1400622842-30173-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ppj8f63n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Quoting Thomas on IRC:
 >> sstrip is a piece of crap that we should exterminate
 >> from the surface of the planet

 > sstrip is now unmaintained, has a long history of generating butchered
 > binaries in some cases, and does not gain that much space in the end.

 > We'd like to obliviate sstrip from the strip options, anihilate the
 > sstrip package, scorch any reference in fire, and cleanse our tree
 > free of any remnants...

 > But first, let's just deprecate it for now.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

 > ---
 > /me postpones getting his flamethrower out of the closet for one
 > more year... ;-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
