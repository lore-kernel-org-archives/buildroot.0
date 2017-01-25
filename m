From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:07:15 +1300
Subject: [Buildroot] [PATCH 1/1] package/lcms2: remove empty variable
 LCMS2_CONF_OPT
In-Reply-To: <20161218140553.30508-1-bernd.kuhls@t-online.de>
References: <20161218140553.30508-1-bernd.kuhls@t-online.de>
Message-ID: <20170125230715.60a25f82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 15:05:53 +0100, Bernd Kuhls wrote:
> Introduced 2013 with the commit adding this package
> https://git.buildroot.net/buildroot/commit/package/lcms2?id=901282aa6e330c5e61ab25a83ba68e443cb3aec2
> without any notice why it is needed.
> 
> The package compiles fine without it so let's remove it.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/lcms2/lcms2.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
