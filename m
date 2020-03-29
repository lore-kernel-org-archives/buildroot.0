From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:22:13 +0200
Subject: [Buildroot] [PATCH RESEND 1/1] package/optee-client: add option
 to configure REE-based storage location
In-Reply-To: <20200324154255.1300634-1-heiko@sntech.de>
References: <20200324154255.1300634-1-heiko@sntech.de>
Message-ID: <20200329222213.23bd8617@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

Thanks for your patch.

On Tue, 24 Mar 2020 16:42:55 +0100
Heiko Stuebner <heiko@sntech.de> wrote:

> +config BR2_PACKAGE_OPTEE_CLIENT_REE_FS_PATH

Why REE_FS_PATH ? The CMake option is named TEE_FS_PARENT_PATH, so I
assume this was a typo, and should have been TEE_FS_PATH, so I fixed
that.

Also, the option should have been within a if BR2_PACKAGE_OPTEE_CLIENT
... endif block, so I fixed that up as well, and applied.

If the REE wording was really correct, let me know.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
