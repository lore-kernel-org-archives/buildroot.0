From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 21:36:32 +0200
Subject: [Buildroot] [PATCH 2/4] swupdate: updated lua check for
 libconfig
In-Reply-To: <20160724232739.14132-3-jordan@yelloz.me>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-3-jordan@yelloz.me>
Message-ID: <20161025213632.359268e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:27:37 -0700, Jordan Yelloz wrote:
> Most probably this was missed in commit
> 65b2ae49feb310d3272a47c44cf3b406646b25c1 which removed pinning to Lua
> 5.2.
> 
> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> ---
>  package/swupdate/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
