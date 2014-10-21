From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 18:33:01 +0200
Subject: [Buildroot] [PATCH 2/4] docs/manual: document makeusers
 group-only creation
In-Reply-To: <1413901599-27312-2-git-send-email-gustavo@zacarias.com.ar>
References: <1413901599-27312-1-git-send-email-gustavo@zacarias.com.ar>
 <1413901599-27312-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021163301.GC3912@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-21 11:26 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  docs/manual/makeusers-syntax.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
> index 5b3f347..8e64a0e 100644
> --- a/docs/manual/makeusers-syntax.txt
> +++ b/docs/manual/makeusers-syntax.txt
> @@ -51,6 +51,8 @@ There are a few restrictions on the content of each field:
>  If +home+ is not +-+, then the home directory, and all files below,
>  will belong to the user and its main group.
>  
> +If +username+ is +-+, then just a group will be created.
> +

I would have preferred we add this to the existing explanations about
the user filed, lsomething like:

    - +username+ is the desired user name (aka login name) for the user.
      It can not be +root+, and must be unique. If set to +-+, then just
      a group will be created.

But I won;t be pedantic about this, so if the maintainer wants it as-is,
you get my:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  Examples:
>  
>  ----
> -- 
> 2.0.4
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
