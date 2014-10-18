From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 19:17:24 +0200
Subject: [Buildroot] [PATCH] tinyalsa: Fix overwrite of asound.h
In-Reply-To: <1413638474-7242-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413638474-7242-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141018191724.2d301631@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 18 Oct 2014 15:21:14 +0200, Maxime Hadjinlian wrote:
> As stated by Maarten ter Huurne on the mailing list, the install of the
> asound.h headers overwrite the one from the toolchains or kernel
> headers.
> Since tinyals's header is only a subset of the 'real' asound.h, there is
> no need to overwrite it.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Maarten ter Huurne <maarten@treewalker.org>
> Cc: Thomas Petazzoni  <thomas.petazzoni@free-electrons.com>
> ---
>  package/tinyalsa/tinyalsa.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
