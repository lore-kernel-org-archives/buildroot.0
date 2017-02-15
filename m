From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:26:34 +0100
Subject: [Buildroot] [PATCH master] redis: bump to version 3.2.8
In-Reply-To: <20170215181036.32625-1-gustavo@zacarias.com.ar>
References: <20170215181036.32625-1-gustavo@zacarias.com.ar>
Message-ID: <20170215212634.10808f82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 15:10:36 -0300, Gustavo Zacarias wrote:
> It fixes a regression in the 3.2.7 security release that can cause server
> deadlocks.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/redis/redis.hash | 4 ++--
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
