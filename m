From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 14:59:34 +0100
Subject: [Buildroot] [PATCH] package/imagemagick: bump to version
 7.0.8-27
In-Reply-To: <20190219220009.14802-1-angelo@amarulasolutions.com>
References: <20190219220009.14802-1-angelo@amarulasolutions.com>
Message-ID: <20190223145934.4e46bfe0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Tue, 19 Feb 2019 23:00:09 +0100
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> This patch bumps imagemagick to version 7.0.8-27
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This breaks legal-info:

ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 2318cc05bbd2c25c1b2d13af1aadccc45b9cf6f94757421ae59a3c8ea9064f1c
ERROR: got     : 5b47db932754743460eba7a226aea85b63e3408d3c7affb4d0117f70c9594ded
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
