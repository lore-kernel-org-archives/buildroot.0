From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jan 2021 11:39:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/python-mwclient: fix legal info
In-Reply-To: <20210103094219.5242-1-bernd.kuhls@t-online.de>
References: <20210103094219.5242-1-bernd.kuhls@t-online.de>
Message-ID: <20210103113914.100c1c28@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Jan 2021 10:42:18 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed due to upstream commit
> https://github.com/mwclient/mwclient/commit/213ecd23c77a6e60e1996a33cfafae1e467ee2ff
> 
> Fixes:
> http://autobuild.buildroot.net/results/d40/d40f3a5122e758aaa5ff7b10d273908849e27bc7/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/python-mwclient/python-mwclient.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
