From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 21:21:39 +0200
Subject: [Buildroot] [PATCH] package/network-manager: don't explicitly
 select QMI/MBIM support
In-Reply-To: <20200505120606.258656-1-aleksander@aleksander.es>
References: <20200505120606.258656-1-aleksander@aleksander.es>
Message-ID: <20200509212139.5d106220@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 May 2020 14:06:06 +0200
Aleksander Morgado <aleksander@aleksander.es> wrote:

> When NetworkManager is built with ModemManager support, it should only
> require the generic ModemManager dependency; it shouldn't configure
> which features ModemManager provides.
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>  package/network-manager/Config.in | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
