From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
Date: Fri, 3 Jan 2020 08:52:37 +0100
Subject: [Buildroot] [PATCH 2/2] board/stm32mp157c-dk2: remove
 unnecessary workaround
In-Reply-To: <CAFkzVZbu5myL8g1QXJML9N1U9AfmO-4bCVRi9eBY-kmiDkj+dQ@mail.gmail.com>
References: <20191103115017.788940-1-b.bilas@grinn-global.com>
 <20191103115017.788940-2-b.bilas@grinn-global.com>
 <20200101172137.4457a417@windsurf>
 <CAFkzVZbu5myL8g1QXJML9N1U9AfmO-4bCVRi9eBY-kmiDkj+dQ@mail.gmail.com>
Message-ID: <8c0786a7-d7c9-847a-8d06-0445c34ed8fc@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Scott,

sure. I'll check if the board boots with the newer kernel and if so I'll 
send a patch at the weekend.

Best
Bartek
On 1/3/20 12:22 AM, Scott Fan wrote:
> Hi Bartosz,
>
> Is possible to bump linux kernel to version 5.4.7? The 5.3.x series 
> has been EOL, ?the "longterm maintenance" series will be acceptable.
>
> Thanks.
>
> On Thu, Jan 2, 2020, 00:21 Thomas Petazzoni 
> <thomas.petazzoni at bootlin.com <mailto:thomas.petazzoni@bootlin.com>> 
> wrote:
>
>     On Sun,? 3 Nov 2019 12:50:17 +0100
>     Bartosz Bilas <b.bilas@grinn-global.com
>     <mailto:b.bilas@grinn-global.com>> wrote:
>
>     > Since we know the proper solution, remove that faulty patch.
>     >
>     > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com
>     <mailto:b.bilas@grinn-global.com>>
>     > ---
>     >? ...-fix-checking-the-presence-of-an-env.patch | 37
>     -------------------
>     >? configs/stm32mp157c_dk2_defconfig? ? ? ? ? ? ?|? 1 -
>     >? 2 files changed, 38 deletions(-)
>     >? delete mode 100644
>     board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
>
>     Applied to master after improving the commit log. Thanks!
>
>     Thomas
>     -- 
>     Thomas Petazzoni, CTO, Bootlin
>     Embedded Linux and Kernel engineering
>     https://bootlin.com
>     _______________________________________________
>     buildroot mailing list
>     buildroot at busybox.net <mailto:buildroot@busybox.net>
>     http://lists.busybox.net/mailman/listinfo/buildroot
>
-- 
*BARTOSZ BI?AS*
Embedded Software Developer 	GRINN
skype:
TEL.+48 71 716 40 99
WEB. grinn-global.com
	Grinn sp. z o.o.
Strzegomska 140a
54-429 Wroc?aw
	KRS:0000230049
NIP:8992730302
REGON:020047322 	S?d Rejonowy we Wroc?awiu
VI Wydzia? Gospodarczy
Kapita? zak?adowy: 125.000,00 z?


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200103/07578b28/attachment.html>
