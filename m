From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:14:55 +0200
Subject: [Buildroot] [PATCH v2] support/scripts/apply-patches.sh: do not
	apply patches with renames
In-Reply-To: <20170919210740.GA2815@scaer> (Yann E. MORIN's message of "Tue,
 19 Sep 2017 23:07:40 +0200")
References: <20170624195936.31528-1-thomas.petazzoni@free-electrons.com>
 <186d2d2e-a3e0-792f-63b7-24a3ac1d4d41@mind.be>
 <20170919210740.GA2815@scaer>
Message-ID: <87lgl9z3zk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> Applied to master after incorporating Yann's and my suggestions, thanks.

 > Which leaves the tree with a single patch that contains renames, which
 > was added by 74a56295 (softether: don't download patch from Github) by
 > Peter. ;-)

Ups, fixed now.

-- 
Bye, Peter Korsgaard
