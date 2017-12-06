From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 21:54:43 +0100
Subject: [Buildroot] [PATCH] package/omxplayer: add missing dependency
 to alsa-lib
In-Reply-To: <20171204213103.26812-1-yann.morin.1998@free.fr>
References: <20171204213103.26812-1-yann.morin.1998@free.fr>
Message-ID: <20171206215443.5f04c748@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Dec 2017 22:31:03 +0100, Yann E. MORIN wrote:
> Since the bump in 58a00a13 (omxplayer: bump to version 2ee17b2),
> omxplayer gained a dependency to alsa-lib.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/652/65212c59a37398681b341263bd76ba8a65ff7828/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Julius Kriukas <julius@kriukas.lt>
> ---
>  package/omxplayer/Config.in    | 3 ++-
>  package/omxplayer/omxplayer.mk | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
