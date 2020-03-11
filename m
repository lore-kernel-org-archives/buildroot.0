From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:55:51 +0100
Subject: [Buildroot] [PATCH v6 12/28] package/qt5webkit: Convert to
 qmake infra
In-Reply-To: <20200217212350.29750-13-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-13-anaumann@ultratronik.de>
Message-ID: <20200311225551.566034b7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:34 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Mostly straightforward conversion.
> The jsc binary was not installed automatically. Unsure of its significance
> the custom install command is kept in a hook.
> 
> Note:
> The generic install creates QtWebProcess in /usr/libexec/ instead of /usr/bin.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/qt5/qt5webkit/qt5webkit.mk | 29 +++++++----------------------
>  1 file changed, 7 insertions(+), 22 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
