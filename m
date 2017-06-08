From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 23:16:55 +0200
Subject: [Buildroot] [PATCH] util-linux: wrap help text at column 72
In-Reply-To: <20170601010010.18346-1-casantos@datacom.ind.br>
References: <20170601010010.18346-1-casantos@datacom.ind.br>
Message-ID: <20170608231655.4ea21c38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 May 2017 22:00:10 -0300, Carlos Santos wrote:
> Respect the <tab><2 spaces><62 chars> rule.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/util-linux/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
