From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 22:47:52 +0100
Subject: [Buildroot] [PATCH 2/2] configs/raspberrypi2: update and fix
	our defconfig
In-Reply-To: <1424817743-3627-2-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 24 Feb 2015 23:42:23 +0100")
References: <1424817743-3627-1-git-send-email-yann.morin.1998@free.fr>
 <1424817743-3627-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87h9u85oqf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Lock to 3.19 kernel headers; and comment about installing DTBs; bump
 > kernel sha1.

 > Reported-by: Peter Korsgaard <jacmet@uclibc.org>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to next, thanks.

Will you also send a patch (for master) doing the same for
raspberrypi_dt_defconfig?

-- 
Bye, Peter Korsgaard
