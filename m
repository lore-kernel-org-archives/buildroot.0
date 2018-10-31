From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:26:11 +0100
Subject: [Buildroot] [PATCH 1/1] go: bump to v1.11.1
In-Reply-To: <20181029165422.32105-1-christian@paral.in>
References: <20181029165422.32105-1-christian@paral.in>
Message-ID: <20181031102611.511a7e3a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Oct 2018 09:54:22 -0700, Christian Stewart wrote:
> Bumps Golang host-go compiler to 1.11.1 release.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 3 ++-
>  package/go/go.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 1c766f2302..d5223d7c1d 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,2 +1,3 @@
>  # From https://golang.org/dl/
> -sha256	afc1e12f5fe49a471e3aae7d906c73e9d5b1fdd36d52d72652dde8f6250152fb	go1.11.src.tar.gz
> +sha256	558f8c169ae215e25b81421596e8de7572bd3ba824b79add22fba6e284db1117  go1.11.1.src.tar.gz
> +

You are adding an empty new line here. I dropped that and applied to
master, thanks!

It would be nice to add a hash for the license file, though.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
