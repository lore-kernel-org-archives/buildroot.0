From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 15:52:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: Disable mod_imagick,
 broken with imagemagick7
In-Reply-To: <1466058413-4945-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466058413-4945-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160616155237.72f77406@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 08:26:53 +0200, Bernd Kuhls wrote:
> Problem sent upstream: https://freeswitch.org/jira/browse/FS-9272
> 
> Fixes
> http://autobuild.buildroot.net/results/e20/e20c0b9a32f6bef5d43369437895058d44d0df58/
> http://autobuild.buildroot.net/results/aa4/aa4d681de85497c2cdd2b0488d9b4569160b5f02/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freeswitch/freeswitch.mk | 5 -----
>  1 file changed, 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
