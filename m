From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 18:57:45 +0200
Subject: [Buildroot] [PATCHv2 1/1] board: add cubieboard2 support
In-Reply-To: <1379490058-4736-2-git-send-email-carlos@crqgestion.es>
References: <1379490058-4736-1-git-send-email-carlos@crqgestion.es>
 <1379490058-4736-2-git-send-email-carlos@crqgestion.es>
Message-ID: <20130918185745.7bb6f0bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Quijano,

On Wed, 18 Sep 2013 09:40:58 +0200, Carlos Quijano wrote:
> 
> Signed-off-by: Carlos Quijano <carlos@crqgestion.es>
> ---
>  .../cubietech/cubieboard/linux-cubieboard2.config  |  749 ++++++++++++++++++++
>  board/cubietech/cubieboard/mkcubiecard.sh          |   15 +-
>  board/cubietech/cubieboard/readme.txt              |    9 +-
>  configs/cubieboard2_defconfig                      |   40 ++
>  package/sunxi-boards/sunxi-boards.mk               |    2 +-
>  5 files changed, 806 insertions(+), 9 deletions(-)
>  create mode 100644 board/cubietech/cubieboard/linux-cubieboard2.config
>  create mode 100644 configs/cubieboard2_defconfig

Looks good to me. I haven't tested that, but I guess you did, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
