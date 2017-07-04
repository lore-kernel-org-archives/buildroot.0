From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:15:53 +0200
Subject: [Buildroot] [PATCH] package/ratpoison: needs MMU
In-Reply-To: <20170704215339.28270-1-romain.naour@smile.fr>
References: <20170704215339.28270-1-romain.naour@smile.fr>
Message-ID: <20170705001553.4bb147e6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 23:53:39 +0200, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/10c/10c0a41275ba53473c89881990ba608b7550b23a
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/ratpoison/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
