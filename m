From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 23:48:45 +0200
Subject: [Buildroot] [PATCH] owfs: disable PHP support
In-Reply-To: <1470434333-17595-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470434333-17595-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160808234845.0781fa5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Aug 2016 23:58:53 +0200, Thomas Petazzoni wrote:
> Since we upgraded PHP to PHP 7.x, the PHP support of OWFS started
> failing to build. Since we can hardly fix that on our own, the issue was
> reported upstream (https://sourceforge.net/p/owfs/support-requests/32/)
> and for now, we will disable PHP support in OWFS.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/fe6843ec53fbed452d2e38a8577a235f73abb8db/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/owfs/owfs.mk | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
