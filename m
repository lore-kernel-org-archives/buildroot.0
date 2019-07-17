From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:20:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libICE: security
 bump version to 1.0.10
In-Reply-To: <20190716194934.25555-1-bernd.kuhls@t-online.de>
References: <20190716194934.25555-1-bernd.kuhls@t-online.de>
Message-ID: <20190717072025.67c56a0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Jul 2019 21:49:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2017-2626, release notes:
> https://lists.x.org/archives/xorg-announce/2019-July/003006.html
> 
> Added all hashes provided by upstream, added license hash.
> Updated _SITE according to release notes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xlib_libICE/xlib_libICE.hash | 9 +++++++--
>  package/x11r7/xlib_libICE/xlib_libICE.mk   | 4 ++--
>  2 files changed, 9 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
