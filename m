From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:57:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: bump to version 1.3.0
In-Reply-To: <20161016085032.27512-1-bernd.kuhls@t-online.de>
References: <20161016085032.27512-1-bernd.kuhls@t-online.de>
Message-ID: <20161016125711.13e750ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Oct 2016 10:50:32 +0200, Bernd Kuhls wrote:
> removed 0003-Conditionally-compile-per-innetgr-availability.patch,
> applied upstream:
> https://git.fedorahosted.org/cgit/linux-pam.git/commit/?id=835d64947996b7cc96fe187f9b3103db36dddf77
> 
> This bump includes
> https://git.fedorahosted.org/cgit/linux-pam.git/commit/?id=01e0038fa55581c4afc9d63b6180d2ea77ba2940
> which fixes
> http://autobuild.buildroot.net/results/394/394e22be0ef986463e97b3040dad8f978262732c/
> 
> Removed comment in Config.in about broken --enable-static-modules
> configure option because it was removed upstream:
> 
> https://git.fedorahosted.org/cgit/linux-pam.git/commit/?id=a684595c0bbd88df71285f43fb27630e3829121e
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...tionally-compile-per-innetgr-availability.patch | 84 ----------------------
>  package/linux-pam/Config.in                        |  6 --
>  package/linux-pam/linux-pam.hash                   |  2 +-
>  package/linux-pam/linux-pam.mk                     |  2 +-
>  4 files changed, 2 insertions(+), 92 deletions(-)
>  delete mode 100644 package/linux-pam/0003-Conditionally-compile-per-innetgr-availability.patch

Applied to master! Thanks a lot for the nice commit log, was great as
it covers all the aspects of the version bump.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
