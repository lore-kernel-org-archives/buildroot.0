From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 12:02:20 +0200
Subject: [Buildroot] [PATCH 17/18] perl-sys-mmap: new package
In-Reply-To: <20180810161502.21598-18-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-18-chrismcc@gmail.com>
Message-ID: <20180813120220.67585ee9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 09:15:01 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/Config.in                        |  1 +
>  package/perl-sys-mmap/Config.in          | 10 ++++++++++
>  package/perl-sys-mmap/perl-sys-mmap.hash |  7 +++++++
>  package/perl-sys-mmap/perl-sys-mmap.mk   | 13 +++++++++++++
>  4 files changed, 31 insertions(+)
>  create mode 100644 package/perl-sys-mmap/Config.in
>  create mode 100644 package/perl-sys-mmap/perl-sys-mmap.hash
>  create mode 100644 package/perl-sys-mmap/perl-sys-mmap.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
