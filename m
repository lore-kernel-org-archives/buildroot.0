From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:35:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/mc: bump version to 4.8.23
In-Reply-To: <20191015231943.6814-1-mc5686@mclink.it>
References: <20191015231943.6814-1-mc5686@mclink.it>
Message-ID: <20191016213538.7ff7c68f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Oct 2019 01:19:43 +0200
Mauro Condarelli <mc5686@mclink.it> wrote:

> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/mc/mc.hash | 7 +++----
>  package/mc/mc.mk   | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mc/mc.hash b/package/mc/mc.hash
> index d980b8a473..9388d6689c 100644
> --- a/package/mc/mc.hash
> +++ b/package/mc/mc.hash
> @@ -1,4 +1,3 @@
> -# Hash from http://ftp.midnight-commander.org/mc-4.8.20.sha256:
> -sha256  017ee7f4f8ae420a04f4d6fcebaabe5b494661075c75442c76e9c8b1923d501c  mc-4.8.20.tar.xz
> -# sha256 locally computed:
> -sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING

You're dropping the hash of the license file. Why ?

> +# Hash from http://ftp.midnight-commander.org/mc-4.8.23.sha256:
> +sha256 238c4552545dcf3065359bd50753abbb150c1b22ec5a36eaa02c82808293267d  mc-4.8.23.tar.bz2
> +sha256 dd7f7ce74183307b0df25b5c3e60ad3293fd3d3d27d2f37dd7a10efce13dff1c  mc-4.8.23.tar.xz

We're only using the .tar.xz file, so having the hash of the .tar.bz2
is not useful.

Could you fix those issues and resend an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
