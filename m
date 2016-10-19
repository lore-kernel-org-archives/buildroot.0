From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:26:12 +0200
Subject: [Buildroot] [PATCH 1/1] docker-engine: add iptables runtime
 dependency
In-Reply-To: <1476911115-12760-1-git-send-email-christian@paral.in>
References: <1476911115-12760-1-git-send-email-christian@paral.in>
Message-ID: <20161019232612.2cfb2965@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 17:05:15 -0400, Christian Stewart wrote:
> The Docker engine calls iptables internally:
> 
> https://github.com/docker/libnetwork/blob/2c921b/iptables/iptables.go#L400
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, after fixing the indentation. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
