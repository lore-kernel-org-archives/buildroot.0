From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 17:59:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: fix build error on
 powerpc/powerpc64
In-Reply-To: <20161225181327.18952-1-bernd.kuhls@t-online.de>
References: <20161225181327.18952-1-bernd.kuhls@t-online.de>
Message-ID: <20161227175947.591a4467@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Dec 2016 19:13:27 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/ffd/ffd689f1ba34ad43f52c38fe37da393a9d8b9d5e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/sdl2/0001-ppc.patch | 47 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/sdl2/0001-ppc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
