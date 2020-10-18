From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2020 13:42:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/mksh: fix legal-info
In-Reply-To: <20201017181628.3462312-1-fontaine.fabrice@gmail.com>
References: <20201017181628.3462312-1-fontaine.fabrice@gmail.com>
Message-ID: <20201018114216.GZ3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-17 20:16 +0200, Fabrice Fontaine spake thusly:
> Commit b6b5981f704ff1196f44835c18c245d5e964b2ab forgot to update hash
> of mksh.1 which is used as the license file
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1291917e4b17e087455a6698c4b82e4ff783600d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after expanding the commit log to state the license
has not changed (only the manpage has). Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/mksh/mksh.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
> index 61a3acdc12..7fc34fa3e3 100644
> --- a/package/mksh/mksh.hash
> +++ b/package/mksh/mksh.hash
> @@ -1,4 +1,4 @@
>  # From http://www.mirbsd.org/mksh.htm#build
>  sha256  907ed1a9586e7f18bdefdd4a763aaa8397b755e15034aa54f4d753bfb272e0e6  mksh-R59b.tgz
>  # Locally computed
> -sha256  4655d87a53a703ead36a52f166f065c23cf58dd02d7b14abd2474f9f49383a16  mksh.1
> +sha256  fb1e64c95ded58058c7f0cf5269236bc83c3cbda089cbb025b03e08f189bf47e  mksh.1
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
