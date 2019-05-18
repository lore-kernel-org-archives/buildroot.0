From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:54:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: bump to version
 0.6.6
In-Reply-To: <1557920768-12145-1-git-send-email-email@gmail.com>
References: <1557920768-12145-1-git-send-email-email@gmail.com>
Message-ID: <20190518215409.087d8b00@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 May 2019 14:46:08 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> From: Vadim Kochan <vadim4j@gmail.com>
> 
> Update to new released version:
> 
>     https://github.com/netsniff-ng/netsniff-ng/releases/tag/v0.6.6
> 
> Changelog:
> 
>     implement rotating capture files in netsniff-ng
>     fixed '--in -' to work again with STDIN in trafgen
>     fixed -t 0 option to use sendto in trafgen
>     checksum calculation for ICMP and TCP in astraceroute
>     fix for reading mirrors from file in astraceroute
>     use GZIP_ENV instead of GZIP in build system
>     added error handling for mismatched address families in mausezahn
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/netsniff-ng/netsniff-ng.hash | 2 +-
>  package/netsniff-ng/netsniff-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
