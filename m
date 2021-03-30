From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:30:35 +0200
Subject: [Buildroot] [PATCH 3/4] package/mender: bump version to 2.5.0
In-Reply-To: <20210320222835.3951325-4-aduskett@gmail.com>
References: <20210320222835.3951325-1-aduskett@gmail.com>
 <20210320222835.3951325-4-aduskett@gmail.com>
Message-ID: <20210330223035.6be159f9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Mar 2021 15:28:34 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@rivian.com>
> 
> Other changes:
>   - Add host-pkgconf as a dependency. It's used to find OpenSSL.
>   - Set new license hashes.
> 
> Signed-off-by: Adam Duskett <Aduskett@rivian.com>
> ---
>  package/mender/mender.hash | 13 ++++++++-----
>  package/mender/mender.mk   |  4 ++--
>  2 files changed, 10 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
