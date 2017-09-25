From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 Sep 2017 09:36:18 -0300
Subject: [Buildroot] [PATCH RESEND 2/2] configs/imx6q-sabresd_defconfig:
	Switch to SPL boot
In-Reply-To: <e6553555-07ef-3d2c-7302-8bdcb264b0cb@mind.be>
References: <1505567532-11583-1-git-send-email-festevam@gmail.com>
 <1505567532-11583-2-git-send-email-festevam@gmail.com>
 <e6553555-07ef-3d2c-7302-8bdcb264b0cb@mind.be>
Message-ID: <CAOMZO5CFOMBvLyYQceMH1FrrKCNgCcGxayRaFRr17e4gGCH3mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, Sep 24, 2017 at 12:10 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Applied both to master, thanks. However, as a follow-up patch, could you:
>
> - rename this to imx6-sabresd_defconfig (since it now also supports DL and Q+);
> - also swith the _qt5 config to SPL;

Just sent a series that addresses this topics.

> - maybe also merge board/freescale/imx6q-sabresd into board/freescale/imx6sabre,
> i.e. a single readme for all imx6sabre board that explains the difference
> between the Freescale and the upstream configs.

This one is currently missing on my series, but I plan to do it on a next step.
