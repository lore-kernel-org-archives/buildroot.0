From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Jul 2014 09:43:27 -0300
Subject: [Buildroot] [PATCH 1/1] PHP-FPM support
In-Reply-To: <FEA3AD43-7908-460F-B390-077CBD689B37@rochsystems.com>
References: <1405365326-2414-1-git-send-email-jordi.llonch@rochsystems.com>
 <53C4598E.90000@zacarias.com.ar>
 <FEA3AD43-7908-460F-B390-077CBD689B37@rochsystems.com>
Message-ID: <53C521EF.8020008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/2014 07:58 PM, Jordi Llonch wrote:

> Thanks Gustavo, 
> This is my first contribution to the project and I appreciate your guidance.
> 
> Will those changes suit better?

Yes, contributions are always welcome, i never added fpm because i don't
use it for my embedded cases.
There's a small typo...

> +PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable--fpm)

...an extra - in --disable-fpm :)
Otherwise looks good, care to resend with that tiny fix?
Thanks.
Regards.
