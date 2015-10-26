From: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Mon, 26 Oct 2015 21:18:36 +0100
Subject: [Buildroot] [PATCH 1/2] x265: new package
In-Reply-To: <20151026180029.GA3788@free.fr>
References: <1445716229-40660-1-git-send-email-thijsvermeir@gmail.com>
 <87d1w2fxgq.fsf@dell.be.48ers.dk> <20151025214020.GL11692@free.fr>
 <CAHCOiUSFUs4Nnr_r99LhkvOwS9HGZ19UPiGd0mwQAZadQDzLfA@mail.gmail.com>
 <20151026180029.GA3788@free.fr>
Message-ID: <CAHCOiUTSfToOw3WH4heRdOtuQRTJ5vRjkaFRLtS03P-beKK=2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Oct 26, 2015 at 7:00 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thijs, All,
>
> On 2015-10-26 13:53 +0100, Thijs Vermeir spake thusly:
>> On Sun, Oct 25, 2015 at 10:40 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> ...
>
> No, it should not be needed to patch the sources of the package.
>
> Just check if changing true/false in x265.mk to ON/OFF still works. If
> so, do the change and send a patch to Buildroot to use ON/OFF instead of
> true/false.
>
> If it does not work, we will keep true/false.

Works like a charm!

Gr,
Thijs

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
