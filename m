From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 21:47:36 +0200
Subject: [Buildroot] [PATCH 1/1] linux: bump 5.13 to 5.13.2
In-Reply-To: <20210715045110.897992-1-james.hilliard1@gmail.com>
References: <20210715045110.897992-1-james.hilliard1@gmail.com>
Message-ID: <20210715214736.1fceacc6@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 14 Jul 2021 22:51:10 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  linux/Config.in  | 2 +-
>  linux/linux.hash | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks! However, could you update package/linux-headers/ at the same
time? We try to keep both in sync.

(Perhaps we should have a comment in both files about this?)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
