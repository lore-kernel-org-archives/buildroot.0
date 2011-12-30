From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 30 Dec 2011 22:44:18 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2012.02/host-tools
In-Reply-To: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4EFE30B2.1030105@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
>
> This is the second posting of this patch set that allows some host
> utilities to be visible in menuconfig, when those host utilities are
> not simply build dependencies, but might also be directly interesting
> for the user (image creation utilities, device programming utilities,
> etc.).
>
> A first posting was done on October, 1st 2011, and the general idea
> and implementation received positive comments from Luca Ceresoli and
> Thomas De Schampheleire.
>
> Changes since v1:
>
>   * Fix a commit log, as per the comment from Luca Ceresoli
>
>   * Add the SAM-BA utility from Atmel as another host utility. This
>     tool can be used from the development machine to reflash a virgin
>     AT91-based device, through USB or serial.
>
> Regards,
>
> Thomas

For the entire series:
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
