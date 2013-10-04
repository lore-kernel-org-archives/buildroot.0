From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Fri, 04 Oct 2013 15:46:25 -0700
Subject: [Buildroot] [PATCH 0/4] i.MX: Refactor and update library
	versions
In-Reply-To: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <524F4541.1090004@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I clearly need to send a V2 of this patch set to remove the
freescale.inc file.

On 09/29/2013 03:54 PM, Eric Nelson wrote:
> This patch set restructures several libraries to share common
> Makefile fragments in package/freescale-imx and bumps the
> library versions to match the Freescale 3.0.35_4.1.0 release
> for i.MX6.
>

Thomas and Arnout: do you want these to stay in /package?

>   create mode 100644 package/freescale-imx/libfslcodec/Config.in
>   create mode 100644 package/freescale-imx/libfslcodec/libfslcodec.mk
>   create mode 100644 package/freescale-imx/libfslparser/Config.in
>   create mode 100644 package/freescale-imx/libfslparser/libfslparser.mk
>   create mode 100644 package/freescale-imx/libfslvpuwrap/Config.in
>   create mode 100644 package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk
>   delete mode 100644 package/libfslcodec/Config.in
>   delete mode 100644 package/libfslcodec/libfslcodec.mk
>   delete mode 100644 package/libfslparser/Config.in
>   delete mode 100644 package/libfslparser/libfslparser.mk
>   delete mode 100644 package/libfslvpuwrap/Config.in
>   delete mode 100644 package/libfslvpuwrap/libfslvpuwrap.mk
>

Please advise,


Eric
