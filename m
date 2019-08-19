From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 22:43:00 +0200
Subject: [Buildroot] [PATCH] package/pigpio: install to staging
In-Reply-To: <20190815134322.31823-1-thomas.petazzoni@bootlin.com>
References: <20190815134322.31823-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190819224300.3ba58203@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Aug 2019 15:43:21 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The pigpio package installs programs and libraries to target, but does
> not install the libraries and its headers to staging, while they may
> be used by other packages. Let's install them, as was requested in bug
> 
> Fixes:
> 
>   https://bugs.busybox.net/show_bug.cgi?id=11741
> 
> Cc: vishalbhalani89 at gmail.com
> Cc: ivan.nazarenko at gmail.com
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pigpio/pigpio.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
