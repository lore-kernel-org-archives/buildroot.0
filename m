From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 19:37:29 +0200
Subject: [Buildroot] [PATCH] support/tests: fix ext4 runtime test
In-Reply-To: <20170714153253.25551-1-yann.morin.1998@free.fr>
References: <20170714153253.25551-1-yann.morin.1998@free.fr>
Message-ID: <20170714193729.73440a35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 17:32:53 +0200, Yann E. MORIN wrote:
> The current test fails because of a legacy option, renamed during the
> recent ext overhaul.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/testing/tests/fs/test_ext.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
