From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:13:38 +0200
Subject: [Buildroot] [PATCHv2] package/mesa3d: vc4 backend is an EGL
 provider
In-Reply-To: <20170813130529.21513-1-yann.morin.1998@free.fr>
References: <20170813130529.21513-1-yann.morin.1998@free.fr>
Message-ID: <20170816231338.36dee1c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Aug 2017 15:05:29 +0200, Yann E. MORIN wrote:
> The VC4 GPU does not support full GL, it only provides EGL.
> 
> Currently, it is possible to build the VC4 backend without ELG support,
> but that does not make sense in the slighest.
> 
> So, forcibly enable EGL with VC4, like is done for etnaviv and virgl.
> 
> Reported-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> 
> ---
> Note:
> Currently, as soon as mesa3d and Xorg are both enabled, then we consider
> that full GL is available. However, that is definitely not the case with
> the VC4 backend, obviously, as the hardware is not capable of that at
> all. Fixing this situation is a bigger endeavour, for anotehr patch(set).

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
