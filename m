From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:26:58 +0200
Subject: [Buildroot] [PATCH 3/7] package/perl-devel-stacktrace: bump to
 version 2.04
In-Reply-To: <20190917181624.29378-3-francois.perrad@gadz.org>
References: <20190917181624.29378-1-francois.perrad@gadz.org>
 <20190917181624.29378-3-francois.perrad@gadz.org>
Message-ID: <20190917222658.505dfc35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Sep 2019 20:16:20 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-devel-stacktrace/perl-devel-stacktrace.hash | 6 +++---
>  package/perl-devel-stacktrace/perl-devel-stacktrace.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.hash b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
> index 1fcfb6438..58923cc07 100644
> --- a/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
> +++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
> @@ -1,6 +1,6 @@
>  # retrieved by scancpan from http://cpan.metacpan.org/
> -md5    1eb6874d834f3d5d15fa626dd726df77 Devel-StackTrace-2.03.tar.gz
> -sha256 7618cd4ebe24e254c17085f4b418784ab503cb4cb3baf8f48a7be894e59ba848 Devel-StackTrace-2.03.tar.gz
> +md5    a5b09f7be7f2b10b525a9740676906d8 Devel-StackTrace-2.04.tar.gz
> +sha256 cd3c03ed547d3d42c61fa5814c98296139392e7971c092e09a431f2c9f5d6855 Devel-StackTrace-2.04.tar.gz
>  
>  # computed by scancpan
> -sha256 e16dd93533bb65e25fad00d06e88840d9b5fd6bb80d551d8866126c52d89e1de LICENSE
> +sha256 dbd3162d261db5b40cac4d85afba619ec6a196398003c57b85c2333e7ef4c393 LICENSE

The hash of the license file has changed, and it should have been
explained in the commit log. I have edited the commit log to add some
explanation, but it would be great to have in your initial submission
for future patches.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
