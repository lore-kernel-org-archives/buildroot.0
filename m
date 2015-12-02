From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Dec 2015 23:40:55 +0100
Subject: [Buildroot] [PATCH 1/2 for 2015.11.x] support/check-host-rpath:
	remove trailing '/' in host dir
In-Reply-To: <b8b895896ff04a0551c1d4b63a623e8c24eb9dfa.1449008170.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 1 Dec 2015 23:19:06 +0100")
References: <cover.1449008170.git.yann.morin.1998@free.fr>
 <b8b895896ff04a0551c1d4b63a623e8c24eb9dfa.1449008170.git.yann.morin.1998@free.fr>
Message-ID: <87mvtseao8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Despite the comment saying so, the trailing '/' in the host directory is
 > not removed. note however that it is properly removed from extracted
 > RPATH tags.

 > This is not visible when the host directory is our default $(O)/host
 > location, but breaks for user-supplied external host ditrectory, when
 > the user leaves a trailing slash in the path.

 > Fix that.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Peter, for the maintenance branch over 2015.11.
 > Sorry for the mess, it's a case I did not test...

Committed, thanks.

I'll create a 2015.11.x branch and cherry pick it there as well.

-- 
Bye, Peter Korsgaard
