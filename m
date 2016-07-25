From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 09:32:53 +0200
Subject: [Buildroot] [PATCH 3/4] swupdate: improved help text for Lua
 support
In-Reply-To: <20160724232739.14132-4-jordan@yelloz.me>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-4-jordan@yelloz.me>
Message-ID: <20160725093253.089ea2a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:27:38 -0700, Jordan Yelloz wrote:

> -	  * Select BR2_PACKAGE_LUA if you want to have Lua support.
> +	  * Select BR2_PACKAGE_LUA or BR2_PACKAGE_LUAJIT if you want to have Lua
> +	    support.
> +	    CONFIG_HANDLER_IN_LUA is not supported in LuaJIT or Lua 5.1.
> +	    swupdate must be manually configured with CONFIG_LUAVERSION="jit-5.1"
> +	    to link against luajit.

What does this last sentence means?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
