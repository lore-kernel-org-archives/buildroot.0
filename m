From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 10:36:53 +0100
Subject: [Buildroot] [PATCH v3] nodejs: version 5.X needs host GCC >= 4.8
In-Reply-To: <1451431668-28340-1-git-send-email-arnout@mind.be>
References: <1451431328-28120-2-git-send-email-arnout@mind.be>
 <1451431668-28340-1-git-send-email-arnout@mind.be>
Message-ID: <20151231103653.15ce8254@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 30 Dec 2015 00:27:48 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Fixes
> http://autobuild.buildroot.org/results/4589dd076585d6472ad1e65926ffe68343b94422
> http://autobuild.buildroot.org/results/e3147c0d9c9eb9f58773b75c8cb4ea49df483611
> and many more.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v3: update commit message 4.X -> 5.X
> v2: no change, just updated autobuild references
> ---
>  package/nodejs/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
