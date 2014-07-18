From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 19:44:18 +0200
Subject: [Buildroot] [lua V3 0/8] lua
In-Reply-To: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140718194418.75355c07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  1 Mar 2014 18:23:01 +0100, Francois Perrad wrote:

> Francois Perrad (8):
>   luajit: refactor without dont-strip.patch
>   luajit: refactor without shared-lib.patch
>   luajit: handles BR2_PREFER_STATIC_LIB
>   luajit: add host variant
>   luainterpreter: add host variant
>   luarocks: allow to work with host-luainterpreter
>   ljlinenoise: new package
>   lua-iconv: new package

From this series, there are still some patches pending in patchwork:

  [lua,V3,4/8] luajit: add host variant
  [lua,V3,5/8] luainterpreter: add host variant
  [lua,V3,6/8] luarocks: allow to work with host-luainterpreter
  [lua,V3,8/8] lua-iconv: new package

Could you respin them by using the host-virtual-package infrastructure
and resend an updated version?

In the mean time, I'll mark those patches as "Changes Requested" in
patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
