From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 10 Aug 2018 11:42:29 -0300
Subject: [Buildroot] [PATCH] configs/imx7ulp-evk: Add new config
In-Reply-To: <20180810162700.3c03c73e@windsurf>
References: <20180717172427.16814-1-marcelo.macedo@nxp.com>
 <20180718120420.3a95fe87@windsurf> <20180810162700.3c03c73e@windsurf>
Message-ID: <CAOMZO5Bvo9Z_c4mw_AYusW7OGDMuFaaiJdZPuBnu2q3a7+cuEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Aug 10, 2018 at 11:27 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

>> Shouldn't we instead create a Buildroot package that would
>> download/extract/install this firmware image, and put it in the FAT
>> partition ?
>
> Fabio, do you have any comment about this ?

I agree with you that we should create a Buildroot package that
handles the Cortex-M4 FreeRTOS binary.

I will work on it when I am back from vacation.

Thanks
