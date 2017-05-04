From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:42:03 +0200
Subject: [Buildroot] [PATCH] luvi: fix build
In-Reply-To: <20170504202900.15617-1-francois.perrad@gadz.org>
References: <20170504202900.15617-1-francois.perrad@gadz.org>
Message-ID: <20170504224203.27ba5e22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 May 2017 22:29:00 +0200, Francois Perrad wrote:
> broken by LuaJIT 2.0.4 --> 2.0.5
> see http://autobuild.buildroot.net/results/3ee/3eef12dbe07fb375e87b2b2898dcc5ef0c11e7a5/build-end.log
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luvi/luvi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
