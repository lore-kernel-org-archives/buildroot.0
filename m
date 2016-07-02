From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:09:05 +0200
Subject: [Buildroot] [PATCH] memcached: bump to version 1.4.28
In-Reply-To: <1467460223-2303-1-git-send-email-gustavo@zacarias.com.ar>
References: <1467460223-2303-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160702150905.45a286ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 08:50:23 -0300, Gustavo Zacarias wrote:
> Removes the 64-bit atomic intrinsics constraint previously introduced.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/memcached/Config.in      | 2 --
>  package/memcached/memcached.hash | 6 +++---
>  package/memcached/memcached.mk   | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
