From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Dec 2016 21:08:04 +0100
Subject: [Buildroot] [PATCH] package/weston: fix build on ancient glibc
In-Reply-To: <1482168120-7386-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 19 Dec 2016 18:22:00 +0100")
References: <1482168120-7386-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87inqfadi3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fix build with ancient glibces.
 > Fixes:
 >     http://autobuild.buildroot.net/results/bce/bcecdbbce4a99eb1e9bfbf519857bf94d8952037/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  ...onfigure-search-for-lib-with-clock_getres.patch | 47 ++++++++++++++++++++++

You forgot to add WESTON_AUTORECONF = YES. Committed with that fixed,
thanks.

-- 
Bye, Peter Korsgaard
