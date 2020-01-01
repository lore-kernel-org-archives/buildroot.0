From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 19:03:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/cc-tool: add hash for license
 file
In-Reply-To: <20200101175838.2525283-1-fontaine.fabrice@gmail.com>
References: <20200101175838.2525283-1-fontaine.fabrice@gmail.com>
Message-ID: <20200101180305.GM3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-01-01 18:58 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cc-tool/cc-tool.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/cc-tool/cc-tool.hash b/package/cc-tool/cc-tool.hash
> index 81844eec82..d778b44395 100644
> --- a/package/cc-tool/cc-tool.hash
> +++ b/package/cc-tool/cc-tool.hash
> @@ -1,3 +1,6 @@
>  # From http://sourceforge.net/projects/cctool/files/
>  sha1 f313e55f019ea5338438633f5b5e689b699343e1  cc-tool-0.26-src.tgz
>  md5 26960676f3e6264e612c299fbf8ec5ea  cc-tool-0.26-src.tgz
> +
> +# Hash for license file
> +sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> -- 
> 2.24.0
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
