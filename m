From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:29:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: bump to
 version 20190110
In-Reply-To: <20190513192622.80031-1-aduskett@gmail.com>
References: <20190513192622.80031-1-aduskett@gmail.com>
Message-ID: <20190514182956.323d9b23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 May 2019 15:26:22 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Also add a hash for the license file.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/ca-certificates/ca-certificates.hash | 7 +++++--
>  package/ca-certificates/ca-certificates.mk   | 4 ++--
>  2 files changed, 7 insertions(+), 4 deletions(-)

Even though it's a version bump, I took it for master. I think it makes
sense to have the latest version of the CA certificates.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
