From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 22 Feb 2017 09:37:33 +0100
Subject: [Buildroot] [PATCH 1/1] libimxvpuapi: bump to version 0.10.3
In-Reply-To: <1487732219-2215-1-git-send-email-danomimanchego123@gmail.com>
References: <1487732219-2215-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAAMH-ysR8MWqExv+ojwc-KNUZKAC7x7XREJ7Cr38SHLqA93Jvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

On Wed, Feb 22, 2017 at 3:56 AM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
>
> Because with libimxvpuapi older than 0.10.3, the gst1-imx-0.12.3 "imxvpu"
> plugin will not build:

Good catch, I wasn't aware gst1-imx got bumped in the first place (not
in the loop).

> Checking for 'libimxvpuapi >= 0.10.3'                            : not found
> could not find installed imxvpuapi library - VPU elements will not be built
>
> After this mod:
>
> Checking for 'libimxvpuapi >= 0.10.3'                            : yes
> found installed imxvpuapi library - VPU elements will be built

I'd remove that part of the commit log, I think the first sentence is
explicit enough.

However, I would add the version changelog so people know what this
bump brings to the table.

You can have the changelog list from the release commit:
https://github.com/Freescale/libimxvpuapi/commit/81a2bbd8

Otherwise:
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
