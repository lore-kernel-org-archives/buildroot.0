From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 22:39:04 +0200
Subject: [Buildroot] [PATCH v5 1/4] package/physfs: new package
In-Reply-To: <20170325215901.15044-1-romain.naour@gmail.com>
References: <20170325215901.15044-1-romain.naour@gmail.com>
Message-ID: <20170326223904.25cd812b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Mar 2017 22:58:58 +0100, Romain Naour wrote:
> Backport a patch from SuperTux project:
> https://github.com/SuperTux/physfs/commit/61d3b63abcba8e9615dcb8a3d1fc026bf7f8d5f8
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v5: Fix license infos (ThomasP,Arnout,Yann)
> v4: add missing license infos
>     Complete lzma license infos (ThomasP)
> v3: new patch
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  .../physfs/0001-Fix-builds-with-modern-GCC.patch   | 38 ++++++++++++++++++++++
>  package/physfs/Config.in                           | 10 ++++++
>  package/physfs/physfs.mk                           | 30 +++++++++++++++++
>  5 files changed, 80 insertions(+)
>  create mode 100644 package/physfs/0001-Fix-builds-with-modern-GCC.patch
>  create mode 100644 package/physfs/Config.in
>  create mode 100644 package/physfs/physfs.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
