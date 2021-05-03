From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 3 May 2021 19:33:06 +0800
Subject: [Buildroot] [PATCH v2 6/6] configs/beaglev: enable building of
 low-level firmware
In-Reply-To: <20210502212141.934384-7-thomas.petazzoni@bootlin.com>
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-7-thomas.petazzoni@bootlin.com>
Message-ID: <CAEUhbmU4Jn_J-0RFt1kCOhSvENRNguLmyzmf47i5gGApNLgyVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 3, 2021 at 5:21 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This commit extends the beaglev_defconfig and its documentation to
> build the low-level firmware, and explain how to reflash it.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  board/beaglev/readme.txt  | 38 ++++++++++++++++++++++++++++++++++++--
>  configs/beaglev_defconfig |  2 ++
>  2 files changed, 38 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
