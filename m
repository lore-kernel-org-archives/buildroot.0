From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Aug 2017 17:51:51 -0300
Subject: [Buildroot] [PATCH 2/2] configs/imx6q-sabresd_qt5: Remove
	CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
In-Reply-To: <8ad9ada1-92ec-c928-4924-2019e7694027@mind.be>
References: <1503339652-7641-1-git-send-email-fabio.estevam@nxp.com>
 <1503339652-7641-2-git-send-email-fabio.estevam@nxp.com>
 <8ad9ada1-92ec-c928-4924-2019e7694027@mind.be>
Message-ID: <CAOMZO5BdOrR06GV7Hvm3QzN0DvjAB6dvr7f36EKjtRiXtSMPJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 21, 2017 at 4:51 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 21-08-17 20:20, Fabio Estevam wrote:
>> From: Fabio Estevam <festevam@gmail.com>
>>
>> Selecting CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y causes touchscreen
>> to behave incorrectly, leading to missed touch events, so remove this
>> option.
>
>  The default *is* performance, so removing the line will set it to performance.
> So I double-checked and indeed, I get the same .config before and after your patch.

Thanks for the clarification. Should be a different issue that I faced
then. Thanks
