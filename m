From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Oct 2020 21:54:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/mraa: renumber patch
In-Reply-To: <20201004111029.515430-1-fontaine.fabrice@gmail.com>
References: <20201004111029.515430-1-fontaine.fabrice@gmail.com>
Message-ID: <20201004195423.GM11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-04 13:10 +0200, Fabrice Fontaine spake thusly:
> Commit fd5376a39d079cc5aa26d67788a0c32d234f2f96 wrongly named the patch
> as 0002-x.patch instead of 0001-x.patch
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...patch => 0001-include-Declare-gVERSION-global-as-extern.patch} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/mraa/{0002-include-Declare-gVERSION-global-as-extern.patch => 0001-include-Declare-gVERSION-global-as-extern.patch} (100%)
> 
> diff --git a/package/mraa/0002-include-Declare-gVERSION-global-as-extern.patch b/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
> similarity index 100%
> rename from package/mraa/0002-include-Declare-gVERSION-global-as-extern.patch
> rename to package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
