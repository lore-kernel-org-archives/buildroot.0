From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 08:59:25 +0200
Subject: [Buildroot] [PATCH 02/05] package/python-autobahn: bump to
 version 19.8.1
In-Reply-To: <20190804010634.85332-2-aduskett@gmail.com>
References: <20190804010634.85332-1-aduskett@gmail.com>
 <20190804010634.85332-2-aduskett@gmail.com>
Message-ID: <20190804085925.0bc99375@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Aug 2019 21:06:31 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> In additon:

Typo: addition

>  - select python-cryptography as it's now a runtime dependency
>  - Gix a typo in the help.

Typo: Fix

> diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
> index 7e1429cdd7..de7bb3662a 100644
> --- a/package/python-autobahn/Config.in
> +++ b/package/python-autobahn/Config.in
> @@ -2,8 +2,9 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
>  	bool "python-autobahn"
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	select BR2_PACKAGE_PYTHON_TXAIO # runtime
> +	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime

We prefer alphabeting ordering.

>  	help
> -	  WebSocket client Hhh server library, WAMP real-time
> +	  WebSocket client & server library, WAMP real-time

I used "and" instead of "&".

I fixed those minor details and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
