From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 21:35:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: bump to version 4.0.0
In-Reply-To: <20190424094006.18440-1-julien.grossholtz@openest.io>
References: <20190424094006.18440-1-julien.grossholtz@openest.io>
Message-ID: <20190424213503.412b955e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Apr 2019 11:40:06 +0200
Julien Grossholtz <julien.grossholtz@openest.io> wrote:

> WolfSSL 4.0.0 has been released, it includes new features and fixes. The
> full changelog is available here [1].
> 
> Update the wolfssl package to stable version 4.0.0, and the
> corresponding hash file.
> 
> [1] https://www.wolfssl.com/docs/wolfssl-changelog/
> 
> Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
> ---
>  package/wolfssl/wolfssl.hash | 2 +-
>  package/wolfssl/wolfssl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
