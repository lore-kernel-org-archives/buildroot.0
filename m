From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 22:58:27 +0200
Subject: [Buildroot] [PATCH v3 3/4] docs/images: adding default
 buildroot linux logo
In-Reply-To: <1527628939-7389-4-git-send-email-angelo@amarulasolutions.com>
References: <1527628939-7389-1-git-send-email-angelo@amarulasolutions.com>
 <1527628939-7389-4-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180630205827.GD23012@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2018-05-29 23:22 +0200, Angelo Compagnucci spake thusly:
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> This patch adds a default buildroot linux boot up logo that can
> be used in all buildroot defconfigs as a buildroot watermark.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  docs/website/images/logo_linux_clut224.png | Bin 0 -> 6825 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 docs/website/images/logo_linux_clut224.png
> 
> diff --git a/docs/website/images/logo_linux_clut224.png b/docs/website/images/logo_linux_clut224.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..002722d09d98272d572e04ea00268dbb234e72c3
> GIT binary patch
> literal 6825
[--SNIP--]

I don't think we need a special logo; we can re-use the exisitng one,
i.e. docs/images/logo.png.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
