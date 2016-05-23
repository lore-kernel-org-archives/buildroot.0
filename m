From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 13:57:53 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.43
In-Reply-To: <1463598503-13738-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463598503-13738-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160523135753.4d742f41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 16:08:23 -0300, Gustavo Zacarias wrote:
> Add new fuse2fs option and disable it for host-e2fsprogs to avoid
> carrying over unused/unnecessary distro/host dependencies.
> 
> Move E2FSPROGS_DEPENDENCIES to the top to avoid nasty mistakes (like
> resetting a previous conditional addition).
> 
> License file renamed from COPYING to NOTICE.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/e2fsprogs/Config.in      |  9 +++++++++
>  package/e2fsprogs/e2fsprogs.hash |  4 ++--
>  package/e2fsprogs/e2fsprogs.mk   | 17 ++++++++++++-----
>  3 files changed, 23 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
