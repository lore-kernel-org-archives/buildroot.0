From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 23:52:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.3.6
In-Reply-To: <20200711180616.34382-1-bernd.kuhls@t-online.de>
References: <20200711180616.34382-1-bernd.kuhls@t-online.de>
Message-ID: <20200711235205.74059fd8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jul 2020 20:06:16 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://blog.torproject.org/new-release-tor-03511-0428-0436-security-fixes
> 
> The fix for CVE-2020-15572 "Fix a crash due to an out-of-bound memory
> access when Tor is compiled with NSS support" does not affect buildroot
> because we do not support building tor with libnss.
> 
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../tor/0001-Fix-static-linking-with-OpenSSL.patch   | 12 ++++++------
>  package/tor/tor.hash                                 |  2 +-
>  package/tor/tor.mk                                   |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
