From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 22:25:56 +0100
Subject: [Buildroot] [PATCH 1/6] lua: add 5.3.x serie
In-Reply-To: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
References: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150116222556.7a9c92ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 16 Jan 2015 22:09:50 +0100, Francois Perrad wrote:

> +ifeq ($(BR2_PACKAGE_LUA_5_3),y)
> +LUA_VERSION = 5.3.0
> +else
>  ifeq ($(BR2_PACKAGE_LUA_5_2),y)
>  LUA_VERSION = 5.2.3
>  else
>  LUA_VERSION = 5.1.5
>  endif

Can we get rid of Lua 5.1 ? If not, at what point do you think it will
be possible ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
