From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 22:42:50 +0200
Subject: [Buildroot] [PATCH] util-linux: select ncurses when "pg" is
 selected
In-Reply-To: <1477335066-14783-1-git-send-email-casantos@datacom.ind.br>
References: <1477335066-14783-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20161024224250.48c80e4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Oct 2016 16:51:06 -0200, Carlos Santos wrote:
> Fixes:
> http://autobuild.buildroot.net/results/63374203f32d2e9407531b53cd5d8f2665944fbe
> http://autobuild.buildroot.net/results/6279cd6f45f54ed5857a2fc08a21d9e257b6bc4b
> http://autobuild.buildroot.net/results/5604c56c0c92483d28e51eb4e70a9741c3c4effe
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/util-linux/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
