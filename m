From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:11:04 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/python-matplotlib: add
 kiwisolver dependency
In-Reply-To: <20190917085034.2509-2-esben@geanix.com>
References: <20190917085034.2509-1-esben@geanix.com>
 <20190917085034.2509-2-esben@geanix.com>
Message-ID: <20190930221104.39c651e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Sep 2019 10:50:34 +0200
Esben Haabendal <esben@geanix.com> wrote:

> This is needed by matplotlib.pyplot, and is also documented at
> https://matplotlib.org/users/installing.html#building-on-linux
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-matplotlib/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
