From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Mon, 30 Mar 2015 13:54:00 +0200
Subject: [Buildroot] [PATCH 1/2] imx6sabresd: rename to imx6sabre
In-Reply-To: <550D8D41.3080504@mind.be>
References: <1426873317-22471-1-git-send-email-vincent.stehle@freescale.com>
 <550D8D41.3080504@mind.be>
Message-ID: <55193958.2080806@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/21/2015 04:24 PM, Arnout Vandecappelle wrote:
..
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Hi Arnout,

Thank you very much for reviewing!

(too big a patch)
..
> So to simplify the review, I've replaced your mail below with the result of git
> format-patch -M

Thanks for the tips. I updated my git config as per your comments; my
next patches should be better.

(create-boot-sd.sh)
..
>  Since it is also used by imx53loco, perhaps it's better to put this script in
> the freescale directory instead?

That makes sense; I will send a v2 patch with the create-boot-sd.sh
script in board/freescale/ then.

(readme.txt mentioning sabre auto)
..
>> +  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb or imx6q-sabreauto.dtb or
>> +    imx6dl-sabreauto.dtb
>  The auto things are only added by the second patch...

Sorry, this is a mistake; thank you for spotting that.

Best regards,

V.
