From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 20 Jan 2015 16:46:13 +0100
Subject: [Buildroot] [PATCH] imx6slevk: fix uImage load address
In-Reply-To: <20150119223351.GI4217@free.fr>
References: <1421578654-11857-1-git-send-email-gilles.talis@gmail.com>
 <20150119223351.GI4217@free.fr>
Message-ID: <CAKcgs2z+qLKMS3ngtChDwFVAXvxgsBz25Wi3hv116yTiQEN-Tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all

2015-01-19 23:33 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Gilles, All,
>
> On 2015-01-18 11:57 +0100, Gilles Talis spake thusly:
>> i.MX6 SoloLite SoC has a different external memory base address
>> than the other i.MX6 family SoCs (0x80000000 for i.MX6 SoloLite
>> vs 0x10000000 for the others).
>
> Could you share a pointer to the reference for this, please?
Yes, this makes sense. Whilst I was looking for this pointer, I
stumbled across this u-boot mailing list thread where the problem is
actually solved:
http://lists.denx.de/pipermail/u-boot/2014-December/199881.html

Would that be enough? or would you prefer I provide the links to the
i.MX6 processors reference manuals where the DDR controller base
address information is stored.

thanks
Gilles.
