From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Sep 2017 09:45:27 +0200
Subject: [Buildroot] [PATCH 1/2] wandboard: genimage: Pass an offset for
	the rootfs
In-Reply-To: <1506002379-23490-1-git-send-email-fabio.estevam@nxp.com> (Fabio
 Estevam's message of "Thu, 21 Sep 2017 10:59:38 -0300")
References: <1506002379-23490-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <87vak2gd7s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <fabio.estevam@nxp.com> writes:

 > Pass an offset of 1MB for the start of the rootfs.
 > Otherwise we get rootfs corruption when the bootloader is manually
 > written to the SD card.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
