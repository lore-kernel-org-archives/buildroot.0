From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:37:01 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/openjpeg: bump to version 2.1
In-Reply-To: <1461620673-31313-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1461620673-31313-1-git-send-email-angelo.compagnucci@gmail.com>
 <1461620673-31313-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160610003701.496e3b5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 23:44:31 +0200, Angelo Compagnucci wrote:
> This patch:
> * bumps openjpeg to version 2.1
> * changes download location to github
> * converts the package to use cmake
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/openjpeg/openjpeg.hash |  2 +-
>  package/openjpeg/openjpeg.mk   | 34 +++++++---------------------------
>  2 files changed, 8 insertions(+), 28 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
