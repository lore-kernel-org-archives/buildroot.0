From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 20 Oct 2018 09:07:11 +0200
Subject: [Buildroot] Boot without busybox
In-Reply-To: <CAJ2oMhJbBLv7eiJo=LNnmHSJms1SQZknD7_dTHM8UfE8xPoTxA@mail.gmail.com>
References: <CAJ2oMhJbBLv7eiJo=LNnmHSJms1SQZknD7_dTHM8UfE8xPoTxA@mail.gmail.com>
Message-ID: <CAOf5uw=FT7GtzwsF+y6xPBPnFETyUo1JsvAax6RXNq-WHA4juQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Sat, Oct 20, 2018 at 9:05 AM Ranran <ranshalit@gmail.com> wrote:
>
> Hello,
>
> As part of Linux hardening we want to remove busybox from filesystem.
> But I am not sure if system can boot without it.
> I am quite sure that there are init files that depends on busybox.

Why you just strip down busybox. Hardening of a minimal init script that come
from busybox seems more reasonable then try to go to start linux init.

>
> Is it possible to boot without busybox or does it require a custom init ?

Let's start that you require some process that it will be your init.
It can be a very limited
an custom one

Michael

>
> Thank you,
> ranran
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
