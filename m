From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:37:05 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/poppler: enable
 autodetection of openjpeg
In-Reply-To: <1461620673-31313-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1461620673-31313-1-git-send-email-angelo.compagnucci@gmail.com>
 <1461620673-31313-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160610003705.4ed19ccf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 23:44:32 +0200, Angelo Compagnucci wrote:
> This patch enables autodetection for installed openjpeg library.
> Previously we were forcing to version 1.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/poppler/poppler.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
