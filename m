From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 May 2017 21:48:14 +0200
Subject: [Buildroot] [PATCH] package/cmake: propagate libuv dependencies
In-Reply-To: <20170506210155.13171-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 6 May 2017 23:01:55 +0200")
References: <20170506210155.13171-1-yann.morin.1998@free.fr>
Message-ID: <87tw4wphxd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In c2c06a6de02,  cmake version was bumped and a new dependency on libuv
 > was added, but it did not propagate all the dependencies of libuv,
 > missing sync_4 (probably because sync_4 was added after the patch was
 > sent on the list, but before it was applied to the tree).

 > Fix that, which fixes unmet dependencies.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
