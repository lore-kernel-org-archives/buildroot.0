From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:59:01 +0200
Subject: [Buildroot] [PATCH 4/5] package/mesa3d: explicitely disable asm
In-Reply-To: <20170326162853.3022-4-romain.naour@gmail.com>
References: <20170326162853.3022-1-romain.naour@gmail.com>
 <20170326162853.3022-4-romain.naour@gmail.com>
Message-ID: <20170401155901.26137f26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Mar 2017 18:28:52 +0200, Romain Naour wrote:
> assembly are enabled by default on supported plaforms even while
> crosscompiling if host == target:
> 
> checking whether to enable assembly... yes, x86_64
> 
> It was also disabled in the mesa package in Fedora since 7.6 [1].
> 
> [1] http://pkgs.fedoraproject.org/cgit/rpms/mesa.git/commit/?id=629c8726
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks. However, it would be good if you could take
this issue with upstream Mesa.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
