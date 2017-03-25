From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:18:08 +0100
Subject: [Buildroot] [PATCH] vnstat: bump to version 1.17
In-Reply-To: <20170324022342.31541-1-rprebello@gmail.com>
References: <20170324022342.31541-1-rprebello@gmail.com>
Message-ID: <20170325151808.43691922@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 23:23:42 -0300, Rodrigo Rebello wrote:
> Also remove patch that has been merged upstream, disable AUTORECONF
> since we're no longer patching configure.ac and get rid of hack
> involving the install target as the 'install-data-hook' in Makefile.am
> now avoids running 'vnstat --showconfig' on the host in case of
> cross-compilation.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  ...ure.ac-add-option-to-disable-image-output.patch | 51 ----------------------
>  package/vnstat/vnstat.hash                         |  2 +-
>  package/vnstat/vnstat.mk                           | 10 +----
>  3 files changed, 2 insertions(+), 61 deletions(-)
>  delete mode 100644 package/vnstat/0001-configure.ac-add-option-to-disable-image-output.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
