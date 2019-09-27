From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:36:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/hidapi: bump to version 0.9.0
In-Reply-To: <20190923190042.15548-1-fontaine.fabrice@gmail.com>
References: <20190923190042.15548-1-fontaine.fabrice@gmail.com>
Message-ID: <20190927233653.3dbd2765@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 21:00:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to github.com/libusb/hidapi to get latest version, see
>   https://github.com/signal11/hidapi/issues/431
> - Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/hidapi/Config.in   | 2 +-
>  package/hidapi/hidapi.hash | 6 +++++-
>  package/hidapi/hidapi.mk   | 6 ++----
>  3 files changed, 8 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
