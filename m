From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 21 Jan 2017 23:25:00 +0100
Subject: [Buildroot] e2fsprogs: keep util-linux's fsck if chosen
In-Reply-To: <975127181.7868248.1484909010264.JavaMail.zimbra@datacom.ind.br>
References: <975127181.7868248.1484909010264.JavaMail.zimbra@datacom.ind.br>
Message-ID: <CAGduivxFHLt=WRGHHks_XeMBTpdzimDfuBcgFyFNcPrsPFGWBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos, all

On Fri, Jan 20, 2017 at 11:43 AM, Carlos Santos <casantos@datacom.ind.br> wrote:
> Maxime,
>
> Did you have time to work on combining these patches?
>
>     http://patchwork.ozlabs.org/patch/696634/
>     http://patchwork.ozlabs.org/patch/697234/
>
> Please let me know if you need some help. I can take care of
> this task if necessary.
I am in holiday for a month so I won't touch anything until then. Feel
free to take up theses patches.
You should know, that it's not only the merge of theses two patches
but a general overhaul of e2fsprogs that should be done (regarding
this issue of having a binary provided by multiple packages that
overrides one another).
IIRC, there are other patches in the patchwork to do that (or on the
mailing list, I seem to remember something about that).
>
> Carlos Santos (Casantos) - DATACOM, P&D
> Rua Am?rica, 1000 - Eldorado do Sul, RS, Brasil - 92990-000
> casantos at datacom.ind.br          +55 51 3933.3000 ext. 3627
> http://www.datacom.ind.br
