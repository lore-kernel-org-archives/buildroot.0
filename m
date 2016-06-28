From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 28 Jun 2016 08:28:53 +0000
Subject: [Buildroot] [PATCH] wandboard: Use HTTP for accessing Linux
 kernel and U-Boot git repos
In-Reply-To: <87eg7hpvm7.fsf@dell.be.48ers.dk>
References: <1467099927-32036-1-git-send-email-abrodkin@synopsys.com>
 <87eg7hpvm7.fsf@dell.be.48ers.dk>
Message-ID: <1467102471.3231.17.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, 2016-06-28 at 10:26 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> ?> Quite often these days Git ports are blocked by firewalls
> ?> [this is especially true in corporate environment] so switching
> ?> to common HTTP(s) is a safe and pretty convenient move.
> 
> ?> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ?> Cc: Stephan Hoffmann <sho@relinux.de>
> ?> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ?> Cc: Sergio Prado <sergio.prado@e-labworks.com>
> ?> Cc: Peter Korsgaard <peter@korsgaard.com>
> ?> ---
> ?>??configs/wandboard_defconfig | 4 ++--
> ?>??1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Committed, thanks.
> 
> ?> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
> ?> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
> 
> This is actually just the 2015.07 release:
> 
> git describe 33711bdd4a4dce942fb5ae85a68899a8357bdd94
> v2015.07
> 
> So I've changed it to use the release tarball instead.

Thanks for that.

Now I'm trying to get Wandboard working from the most recent upstream
kernel and U-Boot. If it all works I'll update that defconfig again :)

-Alexey
