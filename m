From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 03:14:08 +0200
Subject: [Buildroot] [PATCH 2/2] opkg: remove opkg-build script
In-Reply-To: <1433549469-29273-1-git-send-email-vsergeev@gmail.com>
References: <1433549469-29273-1-git-send-email-vsergeev@gmail.com>
Message-ID: <20150606031408.74bda549@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vanya Sergeev,

On Fri,  5 Jun 2015 17:11:09 -0700, Vanya Sergeev wrote:
> This package building script is several years old and unused by buildroot.
> opkg users looking for a current version of this script should visit the
> opkg-utils repository at http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/,
> where this script is maintained and versioned.
> 
> Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
> ---
>  package/opkg/opkg-build | 127 ------------------------------------------------
>  1 file changed, 127 deletions(-)
>  delete mode 100755 package/opkg/opkg-build

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
