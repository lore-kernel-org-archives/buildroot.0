From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 10:40:58 +0200
Subject: [Buildroot] [PATCH] package/libsepol|libselinux: fix build on
 ancient distros
In-Reply-To: <1467445635-31782-1-git-send-email-yann.morin.1998@free.fr>
References: <1467445635-31782-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160702104058.525ce853@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 09:47:15 +0200, Yann E. MORIN wrote:
> Ancient distros (especially enterprise-grade still in use) do not accept
> ln --relative.
> 
> Revert the upstream commit, since the problem it was trying to fix is
> not applicable in the cntext of Buildroot (even with a merged /usr).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Adam Duskett <Aduskett@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libselinux/0003-revert-ln-relative.patch | 24 ++++++++++++++++++++++++
>  package/libsepol/0004-revert-ln-relative.patch   | 24 ++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 package/libselinux/0003-revert-ln-relative.patch
>  create mode 100644 package/libsepol/0004-revert-ln-relative.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
