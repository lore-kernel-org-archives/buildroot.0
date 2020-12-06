From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Dec 2020 20:51:19 +0100
Subject: [Buildroot] [PATCH v4 2/4] package/qt5/qt5coap: new package
In-Reply-To: <20201124065917.1567055-2-angelo@amarulasolutions.com>
References: <20201124065917.1567055-1-angelo@amarulasolutions.com>
 <20201124065917.1567055-2-angelo@amarulasolutions.com>
Message-ID: <20201206205119.0ca0e4fe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Nov 2020 07:59:15 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> The Qt CoAP module implements the client side of CoAP defined by RFC
> 7252.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> Changelog                             
> v1 -> v2:                             
> * Fixed hash file (suggested by Peter)
> v2 -> v3:                             
> * Moved to use FOO_INCLUDE_FIXUP      
> v3 -> v4:                             
> * Renamed FOO_INCLUDE_FIXUP to FOO_SYNC_HEADERS

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
