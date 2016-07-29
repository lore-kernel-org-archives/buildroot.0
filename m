From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 29 Jul 2016 13:29:25 -0300
Subject: [Buildroot] [PATCH] warpboard: linux.fragment: Do not use
 CONFIG_BRCMFMAC as built-in
In-Reply-To: <1469809393.3805.12.camel@embedded.rocks>
References: <1469799930-20206-1-git-send-email-fabio.estevam@nxp.com>
 <1469809393.3805.12.camel@embedded.rocks>
Message-ID: <CAOMZO5D97HFN-Au4LwWE1QkMdXv--yeA7FYWpU7ScVZ5xGR+yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Fri, Jul 29, 2016 at 1:23 PM, J?rg Krause
<joerg.krause@embedded.rocks> wrote:

>> --- a/board/freescale/warpboard/linux.fragment
>> +++ b/board/freescale/warpboard/linux.fragment
>> @@ -1,2 +1 @@
>>  CONFIG_CFG80211_WEXT=y
>> -CONFIG_BRCMFMAC=y
>
> Shouldn't this be "CONFIG_BRCMFMAC=m"?

CONFIG_BRCMFMAC=m is already selected in imx_v6_v7_defconfig, so
that's I why I simply remove this option from linux.fragment.

Regards,

Fabio Estevam
