From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:41:20 +0200
Subject: [Buildroot] [PATCH] redis: bump to version 3.2.5
In-Reply-To: <1477671131-7056-1-git-send-email-gustavo@zacarias.com.ar>
References: <1477671131-7056-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161029154120.22fd7f98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Oct 2016 13:12:11 -0300, Gustavo Zacarias wrote:
> Adjust default config patch to match new major version.
> localhost binding is now default so drop it, 300s keepalive is now
> default as well (instead of 60s from the previous patch and 0 by
> default) - which sounds reasonable so keep it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...3-redis.conf-adjust-defauts-for-buildroot.patch | 29 +++++++++++++++++
>  package/redis/0003-redis.conf-sane-defaults.patch  | 37 ----------------------
>  package/redis/redis.hash                           |  4 +--
>  package/redis/redis.mk                             |  2 +-
>  4 files changed, 32 insertions(+), 40 deletions(-)
>  create mode 100644 package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
>  delete mode 100644 package/redis/0003-redis.conf-sane-defaults.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
