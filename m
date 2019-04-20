From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:16:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/binutils: fix build error due
 to architecture name is incomplete
In-Reply-To: <20190418094655.6526-1-nylon7@andestech.com>
References: <20190418094655.6526-1-nylon7@andestech.com>
Message-ID: <20190420161653.79150ab3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 17:46:55 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> Fixes
>   http://autobuild.buildroot.net/results/128/12803a705586e82fdfb49013da2eb3b9879ccd45/
> 
> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> Signed-off-by: Greentime Hu <greentime@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  Makefile                   | 1 +
>  arch/Config.in.nds32       | 2 +-
>  package/binutils/Config.in | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
