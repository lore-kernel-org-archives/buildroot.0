From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:56:31 +0200
Subject: [Buildroot] [PATCH 1/3] package/mesa3d: disable libva support
In-Reply-To: <1438198976-25523-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438198976-25523-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150729225631.7c7b3354@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 29 Jul 2015 21:42:54 +0200, Bernd Kuhls wrote:
> Informations about the circular dependency can be found here:
> http://linuxfromscratch.org/blfs/view/systemd/multimedia/libva.html
> 
> Fixes
> http://autobuild.buildroot.net/results/b51/b516676ca0e695b3dbc3c33622d527b89a227932/
> http://autobuild.buildroot.net/results/035/03588be2fbd71bfc68619297dace52a909ffe261/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
