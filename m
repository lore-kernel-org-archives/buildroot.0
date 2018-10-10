From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:29:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/ntp: security bump to version
 4.2.8p12
In-Reply-To: <20181010090257.15011-1-apanfilov@spectracom.com>
References: <20181010090257.15011-1-apanfilov@spectracom.com>
Message-ID: <20181010212954.07ec96e8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 09:03:05 +0000, Artyom Panfilov wrote:
> Release notes:
> https://www.nwtime.org/network-time-foundation-publishes-ntp-4-2-8p12
> 
> Fixed security issues:
> 
>   CVE-2016-1549 / CVE-2018-7170: Sybil vulnerability: ephemeral association
>   attack
> 
>   CVE-2018-12327: The openhost() function used during command-line hostname
>   processing by ntpq and ntpdc can write beyond its buffer limit
> 
> Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
> ---
>  package/ntp/ntp.hash | 2 +-
>  package/ntp/ntp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
