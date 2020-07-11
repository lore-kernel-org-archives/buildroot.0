From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 23:52:08 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tor: bump version to 0.4.3.6
In-Reply-To: <20200711181244.34680-1-bernd.kuhls@t-online.de>
References: <20200711181244.34680-1-bernd.kuhls@t-online.de>
Message-ID: <20200711235208.40b8c16c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jul 2020 20:12:44 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes for 0.4.3.5: https://blog.torproject.org/node/1872
> "Tor 0.4.3.5 is the first stable release in the 0.4.3.x series."
> 
> Release notes for 0.4.3.6: https://blog.torproject.org/node/1900
> 
> The fix for CVE-2020-15572 "Fix a crash due to an out-of-bound memory
> access when Tor is compiled with NSS support" does not affect buildroot
> because we do not support building tor with libnss.
> 
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: squashed with 0.4.3.5 bump:
>     http://patchwork.ozlabs.org/project/buildroot/patch/20200516125004.1228983-1-bernd.kuhls at t-online.de/

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
