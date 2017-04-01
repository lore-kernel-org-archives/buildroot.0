From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:57:28 +0200
Subject: [Buildroot] [PATCH 3/5] package/meda3d: add xlib_libXvMC
 optional dependency
In-Reply-To: <20170326162853.3022-3-romain.naour@gmail.com>
References: <20170326162853.3022-1-romain.naour@gmail.com>
 <20170326162853.3022-3-romain.naour@gmail.com>
Message-ID: <20170401155728.293ccb11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Mar 2017 18:28:51 +0200, Romain Naour wrote:
> If xlib_libXvMC package is build before mesa3d, it will be detected and
> enabled by the configure script.
> 
> Handle xlib_libXvMC in mesa3d for consistency.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks. There was a typo in the commit title, but I
saw it right after pushing, so too late.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
