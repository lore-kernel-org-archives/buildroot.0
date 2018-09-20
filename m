From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Sep 2018 22:21:26 +0200
Subject: [Buildroot] [PATCH] package.bison: fix build on host with
 glibc-2.28
In-Reply-To: <20180819165931.23259-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 19 Aug 2018 18:59:31 +0200")
References: <20180819165931.23259-1-yann.morin.1998@free.fr>
Message-ID: <87bm8rq5rt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Similarly to c48f8a6462 (package/m4: fix build on host with glibc-2.28),
 > backport the two fixes fromn gnulib upstream, that allows building
 > host-bison on systems using glibc 2.28.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reported-by: c32 on IRC

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
