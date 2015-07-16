From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:19:51 +0200
Subject: [Buildroot] [PATCH] audit: Update patch from upstream feedback
In-Reply-To: <1437080723-59868-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1437080723-59868-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150716231951.01352b0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton,

On Thu, 16 Jul 2015 16:05:23 -0500, Clayton Shotwell wrote:
> After working with the audit maintainers to get patches accepted, the
> following one had to be reworked to meet their standards. This patch
> will be included in the next version of audit.
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/audit/0001-Enable-cross-compiling.patch | 657 ++++++++++--------------
>  1 file changed, 285 insertions(+), 372 deletions(-)

Glad to see that you've raised this up with upstream and that things
will improve! I've applied your patch, awaiting a new upstream release
which will allow us to get rid of these fairly big patches.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
