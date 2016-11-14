From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 21:18:36 +0100
Subject: [Buildroot] [PATCH next] package/{mesa3d,
 mesa3d-headers}: bump version to 13.0.1
In-Reply-To: <20161114140136.33344-1-Vincent.Riera@imgtec.com>
References: <20161114140136.33344-1-Vincent.Riera@imgtec.com>
Message-ID: <20161114211836.18c509d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 14:01:36 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 4 ++--
>  package/mesa3d/mesa3d.mk                 | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Well, in fact the bump to mesa 13.0 was probably a bad thing, it's
apparently a development version, and it's causing a number of build
issues (not in mesa itself, but in other packages using it).

Does 13.0.1 fixes those issues? See Yann's mail about this:

From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: Remove opengl headers files if opengl support is disabled
Date: Sun, 13 Nov 2016 15:09:18 +0100

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
