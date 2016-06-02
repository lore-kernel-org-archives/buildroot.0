From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jun 2016 22:59:48 +0200
Subject: [Buildroot] [PATCH] package/make: fix hash type (md5 instead of
 sha1)
In-Reply-To: <1464892503-32325-1-git-send-email-jcmvbkbc@gmail.com>
References: <1464892503-32325-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160602205948.GA3714@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max, All,

On 2016-06-02 21:35 +0300, Max Filippov spake thusly:
> Fixes:
>   http://autobuild.buildroot.net/results/133cdeaa0644405568c3e8fc003d73c4570fbc82/
>   http://autobuild.buildroot.net/results/e162f46458f4948c75550d47710bee92f1602273/
>   http://autobuild.buildroot.net/results/7ca74c9ea36321e1940ee2707af5745b7d4498d2/
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/make/make.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/make/make.hash b/package/make/make.hash
> index 528822f..81f7044 100644
> --- a/package/make/make.hash
> +++ b/package/make/make.hash
> @@ -1,4 +1,4 @@
>  # From http://lists.gnu.org/archive/html/info-gnu/2016-05/msg00013.html
> -sha1 85ad14d08766201ffe71efa866f4fb91  make-4.2.tar.bz2
> +md5 85ad14d08766201ffe71efa866f4fb91  make-4.2.tar.bz2

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Incidentally, we could probably check that the hash is properly formed
according to its psecification before checking it...

Regards,
Yann E. MORIN.

>  # Locally calculated after checking signature
>  sha256 4e5ce3b62fe5d75ff8db92b7f6df91e476d10c3aceebf1639796dc5bfece655f  make-4.2.tar.bz2
> -- 
> 2.1.4
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160602/1b464e93/attachment.asc>
