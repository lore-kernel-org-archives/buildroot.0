From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:29:30 +0100
Subject: [Buildroot] [PATCH] erlang-fast_tls: remove unused package
In-Reply-To: <1456092987-17791-1-git-send-email-fhunleth@troodon-software.com>
References: <1456092987-17791-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160221232930.638777a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Sun, 21 Feb 2016 17:16:27 -0500, Frank Hunleth wrote:
> This package was added in error when updating ejabberd dependencies. It
> is not used.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/Config.in                          |  1 -
>  package/erlang-fast_tls/Config.in          |  8 --------
>  package/erlang-fast_tls/erlang-fast_tls.mk | 14 --------------
>  3 files changed, 23 deletions(-)
>  delete mode 100644 package/erlang-fast_tls/Config.in
>  delete mode 100644 package/erlang-fast_tls/erlang-fast_tls.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
