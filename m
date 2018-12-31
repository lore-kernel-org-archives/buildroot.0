From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:58:22 +0100
Subject: [Buildroot] [PATCH v3] lua*: regeneration of Config.in
In-Reply-To: <20181219081707.1983-4-francois.perrad@gadz.org>
References: <20181219081707.1983-1-francois.perrad@gadz.org>
 <20181219081707.1983-4-francois.perrad@gadz.org>
Message-ID: <20181231175822.7d2abd02@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed, 19 Dec 2018 09:17:05 +0100, Francois Perrad wrote:

> diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
> index e6b587e65..26e79e23b 100644
> --- a/package/ljlinenoise/Config.in
> +++ b/package/ljlinenoise/Config.in
> @@ -1,9 +1,7 @@
>  config BR2_PACKAGE_LJLINENOISE
>  	bool "ljlinenoise"
> -	# ljsyscall is specifically for LuaJIT, not Lua.

I think this was useful to keep.

> diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
> index 3af9dabe9..601d0b122 100644
> --- a/package/ljsyscall/Config.in
> +++ b/package/ljsyscall/Config.in
> @@ -1,12 +1,11 @@
>  config BR2_PACKAGE_LJSYSCALL
>  	bool "ljsyscall"
> -	# ljsyscall is specifically for LuaJIT, not Lua.

And this as well.

So I've re-added those two lines when applying the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
