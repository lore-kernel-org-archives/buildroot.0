From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:17:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix license hash
In-Reply-To: <20191027181505.6684-1-bernd.kuhls@t-online.de>
References: <20191027181505.6684-1-bernd.kuhls@t-online.de>
Message-ID: <20191027201726.528d3044@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 19:15:05 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> README was updated upstream:
> https://github.com/systemd/systemd/commits/master/README
> 
> Also remove whitespace.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/systemd/systemd.hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Titouan submitted another patch fixing this before, so I applied his
patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
