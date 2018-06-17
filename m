From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:57:44 +0200
Subject: [Buildroot] [PATCH] qt5script: fix build issue with 32-bits
 armv8-a
In-Reply-To: <20180611135417.18259-1-gael.portay@savoirfairelinux.com>
References: <20180611135417.18259-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180617145744.076a6b90@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jun 2018 09:54:17 -0400, Ga?l PORTAY wrote:
> Adds WTF platform support for the 32-bits armv8-a architectures.
> 
> Fixes:
> 
> 	In file included from ../3rdparty/javascriptcore/JavaScriptCore/config.h:26,
> 	                from ../3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_compile.cpp:44:
> 	../3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h:370:6: error: #error "Not supported ARM architecture"
> 	#    error "Not supported ARM architecture"
> 	     ^~~~~
> 
> The patch is based on two upstream fixes in WebKit[1][2].
> 
> See also commit cea7aa873a.
> 
> [1]: https://github.com/WebKit/webkit/commit/313d9fc4bdd2f020a5d0cf834c3c61982f161ebb
> [2]: https://github.com/WebKit/webkit/commit/98f0de0709786f5d9b09dfd5908266990eb909d6
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
> Hi all,

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
