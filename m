From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 15:04:49 +0200
Subject: [Buildroot] [PATCH v2] configs: warpboard: Move to kernel
	version 4.4.15
In-Reply-To: <1469560128-25586-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Tue, 26 Jul 2016 16:08:48 -0300")
References: <1469560128-25586-1-git-send-email-festevam@gmail.com>
Message-ID: <87invrxmdq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > From: Fabio Estevam <fabio.estevam@nxp.com>
 > Currently warpboard uses a 4.0.5 kernel version from github.

 > Move to version 4.4.15, which is a long term supported kernel version.

 > With 4.4.15 we no longer need the extra two kernel patches as they have
 > already been upstreamed.

 > Use a linux fragment file, so that wireless can be functional by default.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
 > ---
 > This one applies against
 > [PATCH v3] configs/warpboard: Generate an sdcard image

 > Changes since v1:
 > - Remove BR2_GLOBAL_PATCH_DIR as we no longer need any extra patches

Sorry, this is the version I committed - Thanks.

-- 
Bye, Peter Korsgaard
