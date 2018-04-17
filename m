From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 08:50:11 +0200
Subject: [Buildroot] [PATCH] package/perl: bump perl-cross to fix build
 with gcc-7 on AArch64
In-Reply-To: <20180416154855.21630-1-yann.morin.1998@free.fr>
References: <20180416154855.21630-1-yann.morin.1998@free.fr>
Message-ID: <20180417085011.3ba59ad4@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 17:48:55 +0200, Yann E. MORIN wrote:
> Reported-by: Ellie Reeves <ellierevves@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Cc: Ellie Reeves <ellierevves@gmail.com>
> ---
>  package/perl/perl.hash | 2 +-
>  package/perl/perl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Fran?ois Perrad submitted another patch that bumps both perl and
perl-cross, so I've applied Fran?ois patch instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
