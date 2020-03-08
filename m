From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:29:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: bump to version 4.2.0
In-Reply-To: <20200302143516.40900-1-james.hilliard1@gmail.com>
References: <20200302143516.40900-1-james.hilliard1@gmail.com>
Message-ID: <20200308152944.619143e8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Mar 2020 07:35:16 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to set -DPROTOBUF_UPDATE_FILES=ON otherwise our protobuf
> headers will be incompatible.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/opencv3/opencv3.hash | 4 ++--
>  package/opencv3/opencv3.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
