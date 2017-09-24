From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 24 Sep 2017 12:24:31 -0300
Subject: [Buildroot] [PATCH RESEND 2/2] configs/imx6q-sabresd_defconfig:
	Switch to SPL boot
In-Reply-To: <e6553555-07ef-3d2c-7302-8bdcb264b0cb@mind.be>
References: <1505567532-11583-1-git-send-email-festevam@gmail.com>
 <1505567532-11583-2-git-send-email-festevam@gmail.com>
 <e6553555-07ef-3d2c-7302-8bdcb264b0cb@mind.be>
Message-ID: <CAOMZO5CWTFvpo-qFhqc2vewQhzDJPzLR_DvPSOUdSFFfgrdHKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, Sep 24, 2017 at 12:10 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 16-09-17 15:12, Fabio Estevam wrote:
>> From: Fabio Estevam <fabio.estevam@nxp.com>
>>
>> U-Boot 2017.07 has switched to SPL boot, which allows the same binary to
>> boot on imx6dl, imx6q and imx6qp sabresd boards.
>>
>> Switch to the SPL mechanism.
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
>
>  Applied both to master, thanks. However, as a follow-up patch, could you:
>
> - rename this to imx6-sabresd_defconfig (since it now also supports DL and Q+);
> - also swith the _qt5 config to SPL;
> - maybe also merge board/freescale/imx6q-sabresd into board/freescale/imx6sabre,
> i.e. a single readme for all imx6sabre board that explains the difference
> between the Freescale and the upstream configs.

Yes, I had this in mind too. Will send it a follow-up patch soon.

>  Also, could a Solo not be supported with the same defconfig?

Yes, in theory. However NXP does not produce a imx6solo sabresd board.

Thanks!
