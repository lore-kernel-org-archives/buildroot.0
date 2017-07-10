From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Jul 2017 18:22:49 +0200
Subject: [Buildroot] [PATCH 1/4 v3] arch/arm: fix -mcpu default values
 for AArch64
In-Reply-To: <b8d56b1cd3b5450c82d885f0215dc042@mirion.com>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <cbd726c5aa26ea8278c518508ba76efc5b796f7a.1499592591.git.yann.morin.1998@free.fr>
 <20170710180458.7ff45d1c@windsurf.lan>
 <b8d56b1cd3b5450c82d885f0215dc042@mirion.com>
Message-ID: <20170710162249.GC3014@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pavel,

On 2017-07-10 16:18 +0000, Tomov, Pavel spake thusly:
> Hi everybody,
> 
> Please remove my e-mail from your exchange list.

You may remove yourself from the list, by following the link that is
repeated at the bottom of every message that comes from the list:

    http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Yann E. MORIN.

> I just posted a ticket (ID 10011) for resolving the failure when Buildroot calls wget.
> 
> Thank you for your understanding,
> 
> Pavel Tomov
> (Mirion technologies)
> 
> -----Original Message-----
> From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Monday, July 10, 2017 9:05 AM
> To: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/4 v3] arch/arm: fix -mcpu default values for AArch64
> 
> Hello,
> 
> On Sun,  9 Jul 2017 11:29:58 +0200, Yann E. MORIN wrote:
> > We have to specify the -mcpu value, even in 64-bit mode.
> >
> > For AArch64, +fp and +simd are the default, so they are totally useless.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Baruch Siach <baruch@tkos.co.il>
> >
> > ---
> > Changes v1 -> v2:
> >   - squash the two changes into one patch  (Thomas)
> >   - remove useless parentheses  (Baruch)
> >   - remove superfluous indentation
> 
> Applied to master, thanks.
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> ________________________________
> 
> PROPRIETARY INFORMATION NOTICE: This e-mail message and all attachments transmitted with it are intended solely for use by the addressee, may contain proprietary information of Mirion Technologies and/or its affiliates, and is subject to all applicable export controls. If the reader of this message is not the intended recipient, you are hereby notified that any review, dissemination, distribution, copying or other use of this message is strictly prohibited. If you have received this message in error, please notify the sender immediately by replying to the message, delete the original message and all attachments from your computer, and destroy any copies you may have made. Thank you.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
