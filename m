From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:57:09 +0100
Subject: [Buildroot] [PATCH v6 13/28] package/qt5webkit-examples:
 Convert to qmake infra
In-Reply-To: <20200217212350.29750-14-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-14-anaumann@ultratronik.de>
Message-ID: <20200311225709.15f7b034@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:35 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Straightforward conversion. Only conditional dependencies have to remain.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  .../qt5webkit-examples/qt5webkit-examples.mk  | 23 +------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
