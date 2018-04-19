From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 22:49:30 +0200
Subject: [Buildroot] [PATCH 1/2] lz4: bump to version 1.8.1.2
In-Reply-To: <d7eb4454e9b67f918eef87dddff7e93616748b36.1524131196.git.baruch@tkos.co.il>
References: <d7eb4454e9b67f918eef87dddff7e93616748b36.1524131196.git.baruch@tkos.co.il>
Message-ID: <20180419224930.00bb1510@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Apr 2018 12:46:35 +0300, Baruch Siach wrote:
> Use lib and lz4 make targets to avoid build of the manual generator, and
> the examples. Both of them use the target compiler to build host tools.
> 
> Add license files hashes.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lz4/lz4.hash | 4 +++-
>  package/lz4/lz4.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
