From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 20:28:43 +0200
Subject: [Buildroot] [PATCH] circus,
 python-psutil: fix syntax in Config.in
In-Reply-To: <1474474708-4848-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1474474708-4848-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160921202843.6e4ed888@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 21:48:28 +0530, Rahul Bedarkar wrote:
> After commit ab930190d775 ("python-psutil: not available on musl")
> we are getting following error when we set defconfig
> 
> package/python-psutil/Config.in:14: syntax error
> package/python-psutil/Config.in:13: invalid option
> package/circus/Config.in:21: syntax error
> package/circus/Config.in:20: invalid option
> 
> Fixes: ab930190d775 ("python-psutil: not available on musl")
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/circus/Config.in        | 2 +-
>  package/python-psutil/Config.in | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
