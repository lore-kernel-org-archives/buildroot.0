From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:56:59 +0200
Subject: [Buildroot] [PATCH] package/bind: remove /usr/sbin/tsig-keygen
 if server is not selected
In-Reply-To: <20190809215321.7874-1-unixmania@gmail.com>
References: <20190809215321.7874-1-unixmania@gmail.com>
Message-ID: <20190811145659.0302dc1c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Aug 2019 18:53:21 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Otherwise it is left as a dangling symlink to ddns-confgen, which is
> also removed.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/bind/bind.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
