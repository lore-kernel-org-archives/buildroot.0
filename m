From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:34:01 +0100
Subject: [Buildroot] [PATCH] Add kernel compression selection.
In-Reply-To: <1436700853-25163-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436700853-25163-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151213223401.46ab1879@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Jul 2015 13:34:13 +0200, Maxime Hadjinlian wrote:
> From: Johan Sagaert <sagaert.johan@proximus.be>
> 
> This selection will ensure that the correct host tools
> will be build used for the kernel compression method used.
> 
> [Maxime: Select the compression opts in the kernel config too ]
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> V3->V4
> 	Add selection menu in the kernel menu section.
> 	This ensures only things needed are build.
> V2->V3
> 	Unconditionally build lz4.
> 	The building overhead is negligible.
> V1->V2
> 	Only add the host-lz4 dependency when ARM is selected.
> 	Don't touch host-lz4 package.
> ---
>  linux/Config.in | 28 ++++++++++++++++++++++++++++
>  linux/linux.mk  | 27 ++++++++++++++++++++++++++-
>  2 files changed, 54 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
