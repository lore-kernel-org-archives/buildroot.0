From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2016 09:34:03 +0200
Subject: [Buildroot] [PATCH 1/1] fwts: needs host-bison and host-flex
In-Reply-To: <1476383266-30963-1-git-send-email-nunes.erico@gmail.com>
References: <1476383266-30963-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161014093403.1dea7cc1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Oct 2016 20:27:46 +0200, Erico Nunes wrote:
> Fixes:
> http://autobuild.buildroot.net/results/2e6bc77e89868d7a9902123ffb602c5b745d4580
> 
> Tested in a minimal debian environment, there should be no missing host
> package dependencies after these.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  package/fwts/fwts.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
