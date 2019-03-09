From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 21:44:13 +0100
Subject: [Buildroot] [PATCH 1/2] package/tpm2-tss: rename tpm2-tss
 libraries in the help text
In-Reply-To: <20190308132710.11116-1-romain.naour@smile.fr>
References: <20190308132710.11116-1-romain.naour@smile.fr>
Message-ID: <20190309214413.25881978@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Mar 2019 14:27:09 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Since tpm2-tss version 2.0.0, tpm2 libraries have been renamed.
> 
> libsapi renamed to libtss2-sys
> https://github.com/tpm2-software/tpm2-tss/commit/5f0ab55d4e46077cb8f0c53a76c5ebd15a088d26
> 
> libtcti-device renamed to libtss2-tcti-device
> libtcti-socket renamed to libtss2-tcti-mssim
> https://github.com/tpm2-software/tpm2-tss/commit/b8584accbd96e38eaea250e31ed3ea580d2bca27
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/tpm2-tss/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
