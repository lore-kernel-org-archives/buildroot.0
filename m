From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Feb 2014 07:32:53 -0300
Subject: [Buildroot] [PATCH] php-gnupg: new package
In-Reply-To: <877g8igsoy.fsf@dell.be.48ers.dk>
References: <1393359365-21266-1-git-send-email-gustavo@zacarias.com.ar>
 <877g8igsoy.fsf@dell.be.48ers.dk>
Message-ID: <530DC2D5.5050703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/2014 05:54 AM, Peter Korsgaard wrote:

>  > +++ b/package/php-gnupg/Config.in
>  > @@ -0,0 +1,9 @@
>  > +config BR2_PACKAGE_PHP_GNUPG
>  > +	bool "php-gnupg"
>  > +	depends on BR2_PACKAGE_PHP
>  > +	depends on BR2_USE_MMU # libassuan
> 
> Does php really work on nonmmu?

The CLI variant builds for nommu, if it works and if it's useful in any
way is quite open to discussion :)
IMHO it's not very useful, most nommu platforms are short on some form
of memory which php likes a lot.
Regards.
