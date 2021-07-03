From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 22:52:30 +0200
Subject: [Buildroot] [PATCH] package/openpgm: fix link for 32-bit x86
In-Reply-To: <1e611fcaedd4a6f29ddf12f9d685d9a29c578d3e.1624608332.git.baruch@tkos.co.il>
References: <1e611fcaedd4a6f29ddf12f9d685d9a29c578d3e.1624608332.git.baruch@tkos.co.il>
Message-ID: <20210703225230.441d3be9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Jun 2021 11:05:32 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Add upstream patch fixing link with libpgm on build for x86 32-bit.
> 
> Fixes:
> http://autobuild.buildroot.net/results/80254e61dc55bc07b16b3b66710946c71b9d53bb/
> http://autobuild.buildroot.net/results/7bce71db86df8ba204153e0ab5022fb5ace9a6e5/
> http://autobuild.buildroot.net/results/24a0aaff8f46953d015218a60da2c9856152eea3/
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Alexander Lukichev <alexander.lukichev@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...hecksum.c-fix-build-with-32-bits-MMX.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/openpgm/0002-openpgm-pgm-checksum.c-fix-build-with-32-bits-MMX.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
