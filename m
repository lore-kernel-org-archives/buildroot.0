From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 09:39:16 +0200
Subject: [Buildroot] [PATCH 12/18] perl-module-runtime: new package
In-Reply-To: <20180810161502.21598-13-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-13-chrismcc@gmail.com>
Message-ID: <20180813093916.22c66b3a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 09:14:56 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/Config.in                                    |  1 +
>  package/perl-module-runtime/Config.in                |  6 ++++++
>  package/perl-module-runtime/perl-module-runtime.hash |  6 ++++++
>  package/perl-module-runtime/perl-module-runtime.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/perl-module-runtime/Config.in
>  create mode 100644 package/perl-module-runtime/perl-module-runtime.hash
>  create mode 100644 package/perl-module-runtime/perl-module-runtime.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
