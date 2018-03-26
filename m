From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Mar 2018 14:51:24 +0200
Subject: [Buildroot] [PATCH] package/eudev: don't forcibly link with -lrt
In-Reply-To: <20180325194805.26284-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 25 Mar 2018 21:48:05 +0200")
References: <20180325194805.26284-1-yann.morin.1998@free.fr>
Message-ID: <878tafuhir.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This was carried over from udev back when it were an separate package,
 > but was not even needed by eudev 1.3 when we introduced it back in 2014
 > (937a95449ec: eudev: new package).

 > Drop it now.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
