From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 13:21:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/liburcu: bump version to 0.10.2
In-Reply-To: <20190325215102.20059-1-nolange79@gmail.com>
References: <20190325215102.20059-1-nolange79@gmail.com>
Message-ID: <20190326132103.7cb65851@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Mar 2019 22:51:02 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> From: Norbert Lange <norbert.lange@andritz.com>
> 
> This includes a fix that might delay application startup
> considerably (11486a15008b9).
> 
> Adapted the patch to point to the correct file.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  .../0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch  | 10 +++++-----
>  package/liburcu/liburcu.hash                           |  6 +++---
>  package/liburcu/liburcu.mk                             |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)

Applied to master, thanks. It might be good to add the hashes of the
license files for this package, as a follow-up improvement.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
