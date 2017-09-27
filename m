From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 10:58:52 +0200
Subject: [Buildroot] [PATCH] wsapi: fix broken patch
In-Reply-To: <20170927083224.12098-1-francois.perrad@gadz.org>
References: <20170927083224.12098-1-francois.perrad@gadz.org>
Message-ID: <20170927105852.05c6368d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Sep 2017 10:32:24 +0200, Francois Perrad wrote:
> see http://autobuild.buildroot.net/results/f03/f03c9a33289ab3104f30c3da98673ad6321db46b/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/wsapi/0001-Lua-5.3-compatibility.patch | 32 +++++++++-----------------
>  1 file changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/package/wsapi/0001-Lua-5.3-compatibility.patch b/package/wsapi/0001-Lua-5.3-compatibility.patch
> index d55c81880..7cc65e116 100644
> --- a/package/wsapi/0001-Lua-5.3-compatibility.patch
> +++ b/package/wsapi/0001-Lua-5.3-compatibility.patch
> @@ -1,21 +1,14 @@
> -From 2d824d2fce31b6a9cc60b2c3f215fbbf1d99c611 Mon Sep 17 00:00:00 2001
> -From: mpeterv <mpeterval@gmail.com>
> -Date: Thu, 3 Dec 2015 13:10:14 +0300
> -Subject: [PATCH] Lua 5.3 compatibility
> +Lua 5.3 compatibility

Please keep a Git-formatted patch. Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
