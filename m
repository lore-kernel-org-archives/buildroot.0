From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Feb 2015 16:39:17 +0100
Subject: [Buildroot] [PATCH 1/3] glibc: add version 2.21
In-Reply-To: <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
 <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150208153917.GH4028@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-02-08 15:07 +0000, Vicente Olivert Riera spake thusly:
> - Add version 2.21
> - Add a hash value for it
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Manually downloaded, and manually checked the hash: OK! :-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/glibc/Config.in  |    3 +++
>  package/glibc/glibc.hash |    1 +
>  2 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 8c033f2..37e108e 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -38,6 +38,9 @@ config BR2_GLIBC_VERSION_2_19
>  config BR2_GLIBC_VERSION_2_20
>  	bool "2.20"
>  
> +config BR2_GLIBC_VERSION_2_21
> +	bool "2.21"
> +
>  endchoice
>  
>  endif
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 094bbda..f194de4 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -6,3 +6,4 @@ md5	197836c2ba42fb146e971222647198dd	eglibc-2.19-svnr25243.tar.bz2
>  sha1	8013c1935b46fd50d2d1fbfad3b0af362b75fb28	eglibc-2.19-svnr25243.tar.bz2
>  sha256	2d3997f588401ea095a0b27227b1d50cdfdd416236f6567b564549d3b46ea2a2	glibc-2.19.tar.xz
>  sha256	f84b6d42aecc288d593c397b0a3d02260a33ee686bce0c634eb9b32798f36ba5	glibc-2.20.tar.xz
> +sha256  aeeb362437965a5d3f40b151094ca79def04a115bd363fdd4a9a0c69482923b8  glibc-2.21.tar.xz
> -- 
> 1.7.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
