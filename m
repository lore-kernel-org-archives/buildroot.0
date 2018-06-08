From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jun 2018 21:25:22 +0200
Subject: [Buildroot] [PATCH 1/2] configs/imx6ulpico: Bump kernel and
 U-Boot
In-Reply-To: <1528478784-7892-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Fri, 8 Jun 2018 14:26:23 -0300")
References: <1528478784-7892-1-git-send-email-festevam@gmail.com>
Message-ID: <87602t5bdp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Bump kernel to version 4.17 and U-Boot to 2018.05.
 > As the imx_v6_v7_defconfig in 4.17 already selects the
 > CONFIG_CFG80211_WEXT option, the linux.fragment can
 > be simply removed.

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
