From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 11:36:38 -0300
Subject: [Buildroot] [PATCH 04/19] package/hiawatha: bump version to 9.12
In-Reply-To: <1429453778-4178-4-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
 <1429453778-4178-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <5533BD76.5070903@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/2015 11:29 AM, Bernd Kuhls wrote:
> diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
> index 76619e0..9a8ec15 100644
> --- a/package/hiawatha/hiawatha.mk
> +++ b/package/hiawatha/hiawatha.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HIAWATHA_VERSION = 9.2
> +HIAWATHA_VERSION = 9.12

Did you try this with polarssl on?
Last time i tried it wanted 1.3.x which has a different API than 1.2.x
(so bumping it would break other packages).
And they don't seem to be able to live side by side either.
Regards.
