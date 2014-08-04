From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 03 Aug 2014 23:13:28 -0300
Subject: [Buildroot] [PATCH v2] nginx: new package
In-Reply-To: <1407102155-2615-1-git-send-email-s.martin49@gmail.com>
References: <1407102155-2615-1-git-send-email-s.martin49@gmail.com>
Message-ID: <53DEEC48.3060404@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/03/2014 06:42 PM, Samuel Martin wrote:

> +################################################################################
> +#
> +# nginx
> +#
> +################################################################################
> +
> +NGINX_VERSION = 1.7.3

Hi Samuel, nice work.
Any particular reason to go latest mainline instead of latest stable?
From a security point of view it'll probably be harder to track down
future discoveries/fixes.
Thanks!
Regards.
