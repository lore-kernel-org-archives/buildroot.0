From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 18 Dec 2020 18:32:53 +0100
Subject: [Buildroot] [buildroot] guidance need to add spash screen with
 buildroot on imx6 board
In-Reply-To: <CAGshWo04oeGhx7Yknnmo7qhYBL6bW6xG3xshzNkZVTrehFL4jQ@mail.gmail.com>
References: <CAGshWo04oeGhx7Yknnmo7qhYBL6bW6xG3xshzNkZVTrehFL4jQ@mail.gmail.com>
Message-ID: <CAOf5uwkrOH4t3bhJYM4741FpcpSHtzHUCBN+Tgx+8Vyckn0xrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 18, 2020 at 6:29 PM manu f <e.fiancette@gmail.com> wrote:
>
> Hello,
>
> All is near on the title.
> I googled but I found nothing I coul use with my actual knoledge (I am newby on kernel compile.)
>
> If somebody could help.

Hi

You need to use simplefb and reserve the memory using in the
bootloader where the bootloader already allocated the memory for it.
Avoid to power it down and be sure that kernel reserve the same and
pick the clock on. I have tested and it works fine in imx6ull

>
> Regards
>
> Emmanuel
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Michael Nazzareno Trimarchi
Amarula Solutions BV
COO Co-Founder
Cruquiuskade 47 Amsterdam 1018 AM NL
T. +31(0)851119172
M. +39(0)3479132170
[`as] https://www.amarulasolutions.com
