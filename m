From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Mon, 30 Mar 2015 13:59:28 +0200
Subject: [Buildroot] [PATCH 2/2] configs: add Freescale SABRE Auto board
 support
In-Reply-To: <550D9052.2000204@mind.be>
References: <1426873317-22471-1-git-send-email-vincent.stehle@freescale.com>
 <1426873317-22471-2-git-send-email-vincent.stehle@freescale.com>
 <550D9052.2000204@mind.be>
Message-ID: <55193AA0.6030302@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/21/2015 04:37 PM, Arnout Vandecappelle wrote:
(board/freescale/imx6sabre/readme.txt)
..
>  I would introduce subheadings here for the two boards, so
> 
> Boot the SABRE board
> ====================
> 
> SABRE SD
> --------
> ...
> 
> SABRE Auto
> ----------
> ...

Hi Arnout,

Thank you for your review; I will add the headings in v2 of both patches
then.

(readme.txt)
..
>> +- connect an RS-232 UART cable to CPU card debug port J18 and connect using a
>  Shouldn't that be Debug UART DB9? I'm just looking at the quick start guide here...

You are right, J18 is indeed the DB9. I will mention both in the
readme.txt in v2, so that it be completely unambiguous.

(Freescale community webpages on buildroot on Sabre SD)
..
>  I don't suppose you've created similar pages for the auto?

For the moment I do not have any page about Sabre Auto, sorry. Probably
I should rather update and re-title the existing pages. This way, the
DOC numbers referenced in the readme.txt would stay the same.

Best regards,

V.
