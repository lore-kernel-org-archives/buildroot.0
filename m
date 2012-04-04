From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 04 Apr 2012 22:34:18 +0200
Subject: [Buildroot] [PATCH v4 2/2] u-boot: build signed image for OMAP
 processors
In-Reply-To: <1332172139-22621-2-git-send-email-luca@lucaceresoli.net>
References: <1332172139-22621-1-git-send-email-luca@lucaceresoli.net>
 <1332172139-22621-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <4F7CB04A.9040803@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 19/03/2012 16:48, Luca Ceresoli ha scritto:
> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>
> ---
>
> Changed in v4:
>   - more verbose help text for config options;
>   - remove unneeded ifeq around the definition for UBOOT_BIN_IFT;
>   - produce an error message if the user-specified cfg file does not exist.
>
> New in v3: rebase on current master.
>
> New in v2: add depends on BR2_arm || BR2_armeb.
>

Bump.

Luca
