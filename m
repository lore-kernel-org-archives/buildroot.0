From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:25:42 +0200
Subject: [Buildroot] [PATCH 04/15] board/wandboard: Leverage the new
	genimage infra
In-Reply-To: <1460577820-32164-5-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-5-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160413222542.64ef3827@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 17:03:29 -0300, Ezequiel Garcia wrote:

> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT=

Not good :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
