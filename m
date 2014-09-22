From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 22 Sep 2014 15:31:31 +0200
Subject: [Buildroot] [PATCH v4 0/4] Improvements to i.MX6 SABRESD boards
 support
In-Reply-To: <20140921212519.296ade2a@free-electrons.com>
References: <1411135972-14968-1-git-send-email-luca@lucaceresoli.net>
 <20140921212519.296ade2a@free-electrons.com>
Message-ID: <542024B3.9040107@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Fri, 19 Sep 2014 16:12:48 +0200, Luca Ceresoli wrote:
>
>> Luca Ceresoli (3):
>>    configs/freescale_imx6qsabresd: rename imx6 to imx6q
>>    configs/freescale_imx6dlsabresd: add defconfig for iMX6DL SabreSD
>>    freescale/imx6-sabresd: document how to create a bootable SD
>>
>> Vincent Stehl? (1):
>>    imx6sabresd: boot to /init in mfgtools mode
>
> I've applied your four patches. However, I'd like to see additional

Now that your patch for USB booting in mfgtools mode has been applied,
you may simplify the booting procedure documented in
https://community.freescale.com/docs/DOC-101842 to remove the tweaks
that are not needed anymore.

Also, the sentence "there are no files for the sabre sd in the boards
folder" is not true anymore.

-- 
Luca
