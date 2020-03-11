From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 23:06:15 +0100
Subject: [Buildroot] [PATCH v6 16/28] package/qt5cinex: Convert to qmake
 infra
In-Reply-To: <20200217212350.29750-17-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-17-anaumann@ultratronik.de>
Message-ID: <20200311230615.34df0b54@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:38 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Keep custom install logic because qt5cinex has no built-in install target.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/qt5cinex/qt5cinex.mk | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
