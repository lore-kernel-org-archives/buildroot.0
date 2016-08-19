From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:42:29 +0200
Subject: [Buildroot] [PATCH] hplip: needs dynamic library
In-Reply-To: <1471552415-1818-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471552415-1818-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160819114229.7b425eaa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 22:33:35 +0200, Thomas Petazzoni wrote:
> hplip needs libdl functionality, so it should depend on
> !BR2_STATIC_LIBS.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/afc01af153b42d13845e2f2828f642e8ccea7e06/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/hplip/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
