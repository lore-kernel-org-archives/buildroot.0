From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:08:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-channels-redis: drop
 unneeded redis dependency
In-Reply-To: <20191003165120.17903-1-fontaine.fabrice@gmail.com>
References: <20191003165120.17903-1-fontaine.fabrice@gmail.com>
Message-ID: <07137c36-4327-88f4-9bae-036198e17bb3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/10/2019 18:51, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/3053d6470da905218817a7d9b3945f07d70f8296
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/python-channels-redis/python-channels-redis.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
> index d56f403a7c..4765c1013a 100644
> --- a/package/python-channels-redis/python-channels-redis.mk
> +++ b/package/python-channels-redis/python-channels-redis.mk
> @@ -10,6 +10,5 @@ PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/79/20/896a5
>  PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
>  PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
>  PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
> -PYTHON_CHANNELS_REDIS_DEPENDENCIES = redis
>  
>  $(eval $(python-package))
> 
