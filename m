From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:05:08 +0100
Subject: [Buildroot] [PATCH for-next 0/25] Lua(Rocks) improvements
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170305220508.5b4d8e67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:22 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

>       package/Config.in: explain that lua package names should start with lua

As we discussed, I marked this one as Changes Requested. Don't forget
to send an updated version :-)

>       luarocks-package: lowercase the upstream name for LuaRocks
>       lua-coat: use PKG_NAME_UPSTREAM
>       lua-cjson: use LUA_CJSON_SUBDIR
>       lua-testmore: use PKG_NAME_UPSTREAM
>       luabitop: use PKG_NAME_UPSTREAM
>       lua: remove documentation from target

I've applied all those remaining patches.

Thanks a lot for the nice cleanup!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
