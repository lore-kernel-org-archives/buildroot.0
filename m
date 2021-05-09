From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Sun, 09 May 2021 10:14:25 +0200
Subject: [Buildroot] [PATCH] package/python-bleak: bump to version 0.11.0
In-Reply-To: <20210507174229.1545379-1-m.niestroj@grinn-global.com>
References: <20210507174229.1545379-1-m.niestroj@grinn-global.com>
Message-ID: <87o8dk5noe.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Marcin Niestroj <m.niestroj@grinn-global.com> writes:

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/python-bleak/Config.in         | 2 +-
>  package/python-bleak/python-bleak.hash | 4 ++--
>  package/python-bleak/python-bleak.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-bleak/Config.in 
> b/package/python-bleak/Config.in
> index 6015361899..43ed65d752 100644
> --- a/package/python-bleak/Config.in
> +++ b/package/python-bleak/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_PYTHON_BLEAK
>  	bool "python-bleak"
>  	depends on BR2_PACKAGE_PYTHON3
> -	select BR2_PACKAGE_PYTHON_TXDBUS # runtime
> +	select BR2_PACKAGE_PYTHON_DBUS_NEXT # runtime
>

I forgot to add 'python-dbus-next' package first. Patch series for 
that
has just been sent [1].

[1] 
https://patchwork.ozlabs.org/project/buildroot/list/?series=242862

--
Regards,
Marcin
