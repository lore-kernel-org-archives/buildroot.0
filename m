From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:48:00 +0100
Subject: [Buildroot] [PATCH v6 10/28] package/qt5wayland: Convert to
 qmake infra
In-Reply-To: <20200217212350.29750-11-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-11-anaumann@ultratronik.de>
Message-ID: <20200311224800.03933ded@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:32 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Straightforward conversion except for the wayland-compositor configure
> option.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/qt5/qt5wayland/qt5wayland.mk | 56 +---------------------------
>  1 file changed, 2 insertions(+), 54 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
