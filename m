From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 11:00:20 +0200
Subject: [Buildroot] [PATCH v2] configs/olimex_a20_olinuxino_micro: new
 board
In-Reply-To: <1435747687-7412-1-git-send-email-luca@lucaceresoli.net>
References: <1435747687-7412-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150702110020.1de0621e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed,  1 Jul 2015 12:48:07 +0200, Luca Ceresoli wrote:
> Add a defconfig for the Olimex A20-OLinuXino-Micro board, reusing most
> of the A20-OLinuXino-Lime files.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changed v1 -> v2:
>  - remove useless reference to U-Boot in the defconfig list (suggested by
>    Fran?ois Perrad)
> ---
>  board/olimex/a20_olinuxino/readme.txt        | 31 +++++++++++++------
>  configs/olimex_a20_olinuxino_micro_defconfig | 46 ++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+), 10 deletions(-)
>  create mode 100644 configs/olimex_a20_olinuxino_micro_defconfig

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
