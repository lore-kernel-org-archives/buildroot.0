From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 10:35:10 +0200
Subject: [Buildroot] [PATCH] util-linux: fix chfn/chsh missing
 dependencies
In-Reply-To: <1398059694-9745-1-git-send-email-s.martin49@gmail.com>
References: <1398059694-9745-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140421103510.52e570d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 21 Apr 2014 07:54:54 +0200, Samuel Martin wrote:
> chfn/chsh utilities need linux-pam.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/cfc/cfc5fd00b9db21b60efe8b74e9966b6192b1da17/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/util-linux/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
