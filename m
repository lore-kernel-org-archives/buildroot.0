From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:51:13 +0200
Subject: [Buildroot] [PATCH] package/heimdal: fix build when the host
 has some DB libs
In-Reply-To: <20180630070310.16596-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 30 Jun 2018 09:03:10 +0200")
References: <20180630070310.16596-1-yann.morin.1998@free.fr>
Message-ID: <87muunft9q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When the host has a DB library installed, namely LMDB, host-heimdal
 > will detect it and try to use, resulting in a build failure due to
 > missing symbols.

 > Really disable all the DB backends, we don't need them.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
