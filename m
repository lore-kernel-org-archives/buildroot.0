From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 21:32:04 +0200
Subject: [Buildroot] [PATCH] gnuradio: add zeromq support
In-Reply-To: <20180625191237.26394-1-gwenj@trabucayre.com>
References: <20180625191237.26394-1-gwenj@trabucayre.com>
Message-ID: <20180701213204.4534741b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jun 2018 21:12:37 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> This patch adds support for sink/source GNURadio blocks to send/receive
> zeromq data stream.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gnuradio/Config.in   |  7 +++++++
>  package/gnuradio/gnuradio.mk | 10 ++++++++++
>  2 files changed, 17 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
