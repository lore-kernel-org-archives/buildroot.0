From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 25 Aug 2016 15:50:48 -0300
Subject: [Buildroot] [PATCH] package/uboot-tols: fix dependency of
 comment about FIT support
In-Reply-To: <1472150751-29450-1-git-send-email-yann.morin.1998@free.fr>
References: <1472150751-29450-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAOMZO5A8Q=BkaNRuu=err=_mGfSe2phbz41nsbVLQCuRX0tDjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Aug 25, 2016 at 3:45 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> When commit 031130a4 added the dependency on sharedlibs for FIT support
> in uboot-tools, the dependency of the comment was added exactly as the
> dependency of the symbol.
>
> That means the comment is shown when FIT support is possible, and hidden
> when it is not, while we want it the other way around...
>
> Fix the dependency.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

There is a typo in the Subject line: u-boot-tols.

Regards,

Fabio Estevam
