From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Apr 2018 17:51:25 +0200
Subject: [Buildroot] [PATCH] package/kmod: fix host install
In-Reply-To: <20180408081151.23331-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 8 Apr 2018 10:11:51 +0200")
References: <20180408081151.23331-1-yann.morin.1998@free.fr>
Message-ID: <87d0z88jk2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The host directory no longer uses /usr.
 > This currently works because we still have the  legacy /usr
 > symlink, but for correctness it is better that we just fix it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
