From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:09:04 +0100
Subject: [Buildroot] [PATCH 00/24] lua
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140301160904.29570bf8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Mon, 24 Feb 2014 08:34:36 +0100, Francois Perrad wrote:

> Francois Perrad (24):
>   lua: remove LUA_INSTALLED_FILES
>   lua: refactor install steps
>   luarocks: never wraps script
>   luajit: refactor without dont-strip.patch
>   luajit: refactor without shared-lib.patch
>   luajit: add host-luajit
>   luarocks: allow to work with host-luajit
>   ljlinenoise: new package
>   lpeg: new package
>   cosmo: new package
>   lua-iconv: new package
>   luajson: new package
>   lualogging: new package
>   dado: new package
>   lrandom: new package
>   lua-testmore: new package
>   lua-coat: new package
>   lua-coatpersistent: new package
>   lua-messagepack: new package
>   lua-csnappy: new package
>   lzlib: new package
>   lunit: new package
>   lpty: new package
>   lsqlite3: new package

I've started applying a certain number of those patches, but when
building some of these Lua packages, I have warning about missing
dependencies. For example, when building luajson:

  Missing dependency for luajson 1.3.2-1: lunit >= 0.4

Or when building lualogging:

  Missing dependency for lualogging 1.3.0-1: luasocket

Are these normal?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
