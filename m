From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:31:40 +0200
Subject: [Buildroot] [PATCH 20/27] package/xtables-addons: bump to
 version 3.4
In-Reply-To: <20190908161229.27032-1-chrismcc@gmail.com>
References: <20190908161229.27032-1-chrismcc@gmail.com>
Message-ID: <20190915213140.605c6b35@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

On Sun,  8 Sep 2019 09:12:29 -0700
Christopher McCrory <chrismcc@gmail.com> wrote:

> Add hash for LICENSE
> 
> This version works with linux kernel 5.0 and newer
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/xtables-addons/xtables-addons.hash | 7 +++----
>  package/xtables-addons/xtables-addons.mk   | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks. However, this new version requires
CONFIG_NF_NAT in the kernel configuration, so I have adjusted linux.mk
accordingly. Also, it is worth mentioning that there is now a 3.5
version of xtables-addons :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
