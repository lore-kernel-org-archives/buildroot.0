From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:49:29 +0100
Subject: [Buildroot] [PATCH v6 11/28] package/qt5webchannel: Convert to
 qmake infra
In-Reply-To: <20200217212350.29750-12-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-12-anaumann@ultratronik.de>
Message-ID: <20200311224929.5e4eed3d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:33 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> The install of the javascript is custom and thus needs to be kept.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/qt5/qt5webchannel/qt5webchannel.mk | 39 ++--------------------
>  1 file changed, 2 insertions(+), 37 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
