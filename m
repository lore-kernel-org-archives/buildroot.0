From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:17:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: bump version to
 3.7.13.5
In-Reply-To: <20191020211733.9625-1-bernd.kuhls@t-online.de>
References: <20191020211733.9625-1-bernd.kuhls@t-online.de>
Message-ID: <20191021211735.7ca7508b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 23:17:33 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The hash for the tarball is not present in
> http://gnuradio.org/releases/gnuradio/sha256sums so we provide a self-
> computed hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gnuradio/gnuradio.hash | 6 ++----
>  package/gnuradio/gnuradio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
