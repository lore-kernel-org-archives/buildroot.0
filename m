From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 22:43:45 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libabseil-cpp new package
In-Reply-To: <20200721214522.3719304-1-aduskett@gmail.com>
References: <20200721214522.3719304-1-aduskett@gmail.com>
Message-ID: <20200725224345.590c187b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Jul 2020 14:45:21 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> This package is a new dependency on grpc versions > 1.25.0
> 
> Tested with the following distributions:
>   - Debian 9
>   - CentOS 7
>   - Fedora 32
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I dropped the glibc dependency thanks to a small patch (submitted
upstream) that checks the availability of <execinfo.h> and only uses it
if available. Then I applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
