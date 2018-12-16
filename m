From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:22:40 +0100
Subject: [Buildroot] [PATCH] package/linux-headers: aarch64_be is not
 supported by kernel version 3.2
In-Reply-To: <20181215121045.27913-1-romain.naour@gmail.com>
References: <20181215121045.27913-1-romain.naour@gmail.com>
Message-ID: <20181216162240.749e8a20@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Dec 2018 13:10:45 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/linux-headers/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
