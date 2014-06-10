From: Davide Viti <zinosat@tiscali.it>
Date: Tue, 10 Jun 2014 11:48:30 +0200
Subject: [Buildroot] [v6] canfestival: new package
In-Reply-To: <1402246400-22382-1-git-send-email-s.martin49@gmail.com>
References: <1402246400-22382-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140610094830.GA15791@zinosat.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Sun, Jun 08, 2014 at 06:53:20PM +0200, Samuel Martin wrote:
> -
> -config BR2_PACKAGE_CANFESTIVAL_PEAK_LINUX
> -	bool "peak_linux"
> -	help
> -	  PeakSystem CAN support (requires kernel driver and libpcan from
> -	  PeakSystem).
> -
> -	  http://www.peak-system.com/linux/
> +# AnaGate CAN(duo) driver [1] and PeakSystem CAN support [2] are not
> +# available (not packaged in BUildroot)

extremely minor typo: BUildroot -> Buildroot

regards,
Davide
