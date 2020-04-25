From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:31:31 +0200
Subject: [Buildroot] [PATCH] package/apparmor: bump to version 2.13.4
In-Reply-To: <20200424214038.382827-1-angelo@amarulasolutions.com>
References: <20200424214038.382827-1-angelo@amarulasolutions.com>
Message-ID: <20200425153131.45d4699a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 23:40:38 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> This patch bumps apparmor/libapparmor to version 2.13.4.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/apparmor/apparmor.hash                |  2 +-
>  package/apparmor/apparmor.mk                  |  2 +-
>  ...el-fixing-for-crosscompiling-environ.patch | 21 +++++++------------
>  package/libapparmor/libapparmor.hash          |  2 +-
>  package/libapparmor/libapparmor.mk            |  2 +-
>  5 files changed, 12 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
