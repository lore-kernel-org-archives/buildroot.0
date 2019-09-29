From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Sep 2019 09:14:25 +0200
Subject: [Buildroot] [PATCH] package/cups-filters: disable Braille
 embosing filters
In-Reply-To: <20190929014900.6470-1-unixmania@gmail.com>
References: <20190929014900.6470-1-unixmania@gmail.com>
Message-ID: <20190929091425.5f09d67e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 22:49:00 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Otherwise they are installed even though the Braille support is not
> built because it requires liblouis, which is not available.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/cups-filters/cups-filters.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
