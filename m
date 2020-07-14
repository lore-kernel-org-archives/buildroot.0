From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:51:31 +0200
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.20
In-Reply-To: <20200625070952.3005722-1-stefan.sorensen@spectralink.com>
References: <20200625070952.3005722-1-stefan.sorensen@spectralink.com>
Message-ID: <20200714225131.7f607f49@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Jun 2020 09:09:52 +0200
stefan at astylos.dk wrote:

> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> Fixes the following security issue:
>  * CVE-2020-8619: It was possible to trigger an INSIST failure when a
>    zone with an interior wildcard label was queried in a certain
>    pattern.
> 
> Release notes:
> https://ftp.isc.org/isc/bind9/cur/9.11/RELEASE-NOTES-bind-9.11.20.txt
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
