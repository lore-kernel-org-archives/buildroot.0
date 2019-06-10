From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 23:57:40 +0200
Subject: [Buildroot] [PATCH v2 2/3] configs/imx7dpico: Bump Linux and
 U-Boot
In-Reply-To: <20190610194144.25958-2-offougajoris@gmail.com>
References: <20190610194144.25958-1-offougajoris@gmail.com>
 <20190610194144.25958-2-offougajoris@gmail.com>
Message-ID: <9ed4ca9f-3934-9857-8f62-5a798de3aeb4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Series applied to master, thanks, with one little change here.

On 10/06/2019 21:41, Joris Offouga wrote:
[snip]
>  # required tools to create the eMMC image
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
> @@ -34,6 +34,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y

 Since no FAT filesystem is created any more, dosfstools and mtools are not needed.

 Regards,
 Arnout
