From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Nov 2018 15:10:19 +0100
Subject: [Buildroot] [PATCH 1/1] Documentation: Add external.desc to
 list of files
In-Reply-To: <20181102125946.6787-1-lists@philipp-wagner.com>
References: <20181102125946.6787-1-lists@philipp-wagner.com>
Message-ID: <20181102141019.GA28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philipp, All,

On 2018-11-02 13:59 +0100, lists at philipp-wagner.com spake thusly:
> From: Philipp Wagner <mail@philipp-wagner.com>
> 
> external.desc must be present when using a br2-external tree. The
> documentation notes this later in the text, but the file is missing from
> the initial overview of files.
> 
> Fixes bug 11481
> 
> Signed-off-by: Philipp Wagner <mail@philipp-wagner.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/customize-directory-structure.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
> index b177319f98..a3a7ad4cb9 100644
> --- a/docs/manual/customize-directory-structure.txt
> +++ b/docs/manual/customize-directory-structure.txt
> @@ -50,6 +50,7 @@ to you.
>  |
>  +-- Config.in (if using a br2-external tree)
>  +-- external.mk (if using a br2-external tree)
> ++-- external.desc (if using a br2-external tree)
>  ------
>  
>  Details on the files shown above are given further in this chapter.
> -- 
> 2.19.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
