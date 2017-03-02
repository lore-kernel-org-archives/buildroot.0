From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:23:56 +0100
Subject: [Buildroot] [PATCH] python-crossbar: add a warning comment
 concerning version bump
In-Reply-To: <20170302135853.3111-1-yegorslists@googlemail.com>
References: <20170302135853.3111-1-yegorslists@googlemail.com>
Message-ID: <20170302222356.4c305ce7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Mar 2017 14:58:53 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The latest crossbar needs a rather recent setuptools package, that
> has circular dependencies. Until this issue is not resolved, it is
> not safe to bump crossbar version.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-crossbar/python-crossbar.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
