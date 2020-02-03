From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 19:51:11 +0100
Subject: [Buildroot] [PATCH 4/5] package/libsepol: change policy version
 to an int
In-Reply-To: <20200203132951.1331252-4-aduskett@gmail.com>
References: <20200203132951.1331252-1-aduskett@gmail.com>
 <20200203132951.1331252-4-aduskett@gmail.com>
Message-ID: <20200203195111.0215471a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Feb 2020 05:29:50 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> The policy version has to be a number, as such, set the type to int.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/libsepol/Config.in     | 4 ++--
>  package/refpolicy/refpolicy.mk | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
