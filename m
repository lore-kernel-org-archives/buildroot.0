From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 21:54:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/iproute2: fix build with uclibc
In-Reply-To: <20200618205342.230787-1-fontaine.fabrice@gmail.com>
References: <20200618205342.230787-1-fontaine.fabrice@gmail.com>
Message-ID: <20200620215410.67c83370@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Jun 2020 22:53:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/08024dd20b174f2e22e641d200f6abd8bd2a9552
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-devlink-update-include-files.patch   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/iproute2/0001-devlink-update-include-files.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
