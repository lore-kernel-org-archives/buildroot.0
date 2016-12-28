From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 23:24:01 +0100
Subject: [Buildroot] [PATCH] configs/warp7: Bump to mainline kernel 4.9
In-Reply-To: <1482954486-28962-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Wed, 28 Dec 2016 17:48:06 -0200")
References: <1482954486-28962-1-git-send-email-festevam@gmail.com>
Message-ID: <8737h7bsla.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Use mainline 4.9 instead of a custom kernel based on NXP 4.1.
 > As mx7 boots in non-secure mode in mainline kernel, change the
 > U-Boot target to "warp7".

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
