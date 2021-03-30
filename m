From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:30:27 +0200
Subject: [Buildroot] [PATCH 1/4] package/mender/mender.mk: use
 MENDER_PKGDIR variable
In-Reply-To: <20210320222835.3951325-2-aduskett@gmail.com>
References: <20210320222835.3951325-1-aduskett@gmail.com>
 <20210320222835.3951325-2-aduskett@gmail.com>
Message-ID: <20210330223027.03bd61f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Mar 2021 15:28:32 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@rivian.com>
> 
> Currently there is a mix of calls to package/mender and $(MENDER_PKGDIR) in the
> mender.mk file. Standardize the calls to only $(MENDER_PKGDIR).
> 
> Signed-off-by: Adam Duskett <Aduskett@rivian.com>
> ---
>  package/mender/mender.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
