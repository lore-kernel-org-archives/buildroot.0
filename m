From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Aug 2016 09:15:36 +0200
Subject: [Buildroot] [PATCH] imx6ulpico: linux.fragment: Disable
	CONFIG_SMP
In-Reply-To: <1470369204-1675-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Fri, 5 Aug 2016 00:53:24 -0300")
References: <1470369204-1675-1-git-send-email-festevam@gmail.com>
Message-ID: <87lh0belev.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > From: Fabio Estevam <fabio.estevam@nxp.com>
 > imx6ul has currently an issue on kernel 4.7 that causes a stall when running
 > the "reboot" command.

 > This issue has been reported in the linux-arm-kernel mailing list, but we
 > don't have a proper fix at the moment.

 > This problem is not seen when SMP is disabled, so let's disable it for now
 > until a proper fix becomes available.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
