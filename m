From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 21 May 2014 07:40:08 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for ld.gold in toolchain.
In-Reply-To: <BLU436-SMTP2194D0C95F4AFEB38829312A83D0@phx.gbl>
References: <BLU436-SMTP2194D0C95F4AFEB38829312A83D0@phx.gbl>
Message-ID: <20140521054008.GC618@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,
Steve Thomas wrote,

> The ld.gold linker has been around for about six years, and is quite
> well supported. It also used to be the only linker for gcc that
> supported the plugin option needed for LTO.
> 
> This patch enables a system to be build with the gold linker which is
> very well supported on recent builds.

But gold is not available for all architectures. I am sure it does
not work for MIPS f.e.

best regards
 Waldemar
 
