From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 21:06:58 +0100
Subject: [Buildroot] [PATCH] configs/mx6sx_udoo_neo: Bump to U-Boot
	2017.01
In-Reply-To: <1484060791-32174-1-git-send-email-fabio.estevam@nxp.com> (Fabio
 Estevam's message of "Tue, 10 Jan 2017 13:06:31 -0200")
References: <1484060791-32174-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <87vatmk7bx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <fabio.estevam@nxp.com> writes:

 > Bump to U-Boot 2017.01, which supports mx6sx_udoo_neo by default.
 > Remove the U-Boot patch that we used for the previous version.

 > Also adjust the 'fdtfile' name as it has been changed in U-Boot
 > mainline.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
 > ---
 >  board/udoo/neo/boot.scr.txt                  |   2 +-
 >  board/udoo/neo/patches/uboot/0001-udoo.patch | 691 ---------------------------

git am complains about this as the hash didn't match, but I've fixed it
up and committed, thanks.

-- 
Bye, Peter Korsgaard
