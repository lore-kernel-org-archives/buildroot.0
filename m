From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:34:34 +0200
Subject: [Buildroot] [PATCH v4 1/9] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
In-Reply-To: <20180325132142.GL2620@scaer> (Yann E. MORIN's message of "Sun,
 25 Mar 2018 15:21:42 +0200")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-2-thomas.petazzoni@bootlin.com>
 <87r2o8xqbc.fsf@dell.be.48ers.dk> <20180325132142.GL2620@scaer>
Message-ID: <871sg8xj79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Ehh, where is that done? Afaik nothing depends on (in the make sense) on
 >> host-patchelf, it is just forcibly enabled in all configs.

 > That's because this is a leftover from a previous non-itreration:

 >     http://lists.busybox.net/pipermail/buildroot/2017-November/207795.html

 > I guess Thomas just forgot to amend the commit-log. I won;t blame him on
 > that one, it happens all the time to me as well! ;-)

Ok, I'll drop that when committing.

-- 
Bye, Peter Korsgaard
