From: Reuben Dowle <reuben.dowle@4rf.com>
Date: Thu, 18 Apr 2013 20:05:48 +0000
Subject: [Buildroot] Configuration question: uboot board name?
In-Reply-To: <CAADET=c7krztyi1ieJYRLc_0pfWY6PjTaVxXSWsStDH+f60mjQ@mail.gmail.com>
References: <CAADET=c7krztyi1ieJYRLc_0pfWY6PjTaVxXSWsStDH+f60mjQ@mail.gmail.com>
Message-ID: <069B5A25F9844945B625ADE7258AC94C062BE1DD@4rf-nz-orion.local.4rf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is not really a buildroot question, rather a question for the u-boot mailing list.

If there is a port for your processor, you should see it in the list of config files in include/configs. If not you can probably create a new board support based of a similar cpu/board.

Reuben Dowle
Software Developer
4RF Limited

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of David Li
> Sent: Friday, 19 April 2013 6:31 a.m.
> To: buildroot
> Subject: [Buildroot] Configuration question: uboot board name?
>
> Hi,
>
> I am using buildroot 2013.2 to build a new uboot image for my EP405
> board. In make menuconfig, what should I use for uboot board name?
>
> I tried "EP405" but the make failed to find it.
>
>
> David
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
