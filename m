From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:17:11 +0100
Subject: [Buildroot] [PATCH] tiff: bump version to 4.0.7 (security)
In-Reply-To: <20161121101350.31299-1-Vincent.Riera@imgtec.com>
References: <20161121101350.31299-1-Vincent.Riera@imgtec.com>
Message-ID: <20161121211711.1eaa3666@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Nov 2016 10:13:50 +0000, Vicente Olivert Riera wrote:
> Fixed CVEs:
>  - CVE-2016-3622
>  - CVE-2016-3623
>  - CVE-2016-5321
>  - CVE-2016-5323
>  - CVE-2016-5652
>  - CVE-2016-5875
>  - CVE-2014-8127
>  - CVE-2015-8665
>  - CVE-2015-8683
>  - CVE-2016-9273
>  - CVE-2016-9448
> 
> Release notes: http://www.simplesystems.org/libtiff/v4.0.7.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/tiff/tiff.hash | 2 +-
>  package/tiff/tiff.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
