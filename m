From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 17:48:11 +0200
Subject: [Buildroot] [PATCH 9/8] core/download: look for archives in the
 global downlaod dir first
In-Reply-To: <20180402151358.14006-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 2 Apr 2018 17:13:58 +0200")
References: <20180402145802.17611-8-maxime.hadjinlian@gmail.com>
 <20180402151358.14006-1-yann.morin.1998@free.fr>
Message-ID: <87fu4dlidg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > For existing setups, the global donload directory may have a lot of the
 > required archives, so lok into there before attempting a adownload.

 > We siply hard-link them if found there and not in the new per-package
 > loaction. Then we resume the existing procedure (which means the new
 > hardlink will get removed if it happened to be incorrect).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed after fixing a few typos, thanks.

-- 
Bye, Peter Korsgaard
