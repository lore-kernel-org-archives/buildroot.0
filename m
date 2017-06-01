From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 1 Jun 2017 13:49:01 +0200
Subject: [Buildroot] [PATCH 1/1] imx-uuc: fix start-stop-daemon stop
	failure
In-Reply-To: <1496266845-11307-1-git-send-email-alexandre.esse.dev@gmail.com>
References: <1496266845-11307-1-git-send-email-alexandre.esse.dev@gmail.com>
Message-ID: <CAAMH-yue_PV20OS_jwxZ6_FfxMT7d8EGn6yRN78ax_ui8kinpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,

On Wed, May 31, 2017 at 11:40 PM, Alexandre Esse
<alexandre.esse.dev@gmail.com> wrote:
> The daemon service script associated with imx-uuc failed to stop the daemon
> since the PID of the process wasn't stored at start time.
>
> Adding -m option allowed to create the uuc.pid file as expected.
>
> Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks for your patch.

Regards,
Gary
