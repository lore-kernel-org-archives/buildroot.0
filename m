From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 15:58:05 +0200
Subject: [Buildroot] [PATCH 1/3] package/bluez_utils: add missing
 host-pkgconf dependency
In-Reply-To: <20170513171009.5219-1-romain.naour@gmail.com>
References: <20170513171009.5219-1-romain.naour@gmail.com>
Message-ID: <20170514155805.323dfe91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 May 2017 19:10:07 +0200, Romain Naour wrote:
> The configure script use pkg-config.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/bluez_utils/bluez_utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
