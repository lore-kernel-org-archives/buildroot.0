From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 12:01:11 +0200
Subject: [Buildroot] [PATCH 16/18] perl-sys-meminfo: new package
In-Reply-To: <20180810161502.21598-17-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-17-chrismcc@gmail.com>
Message-ID: <20180813120111.68270c82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 09:15:00 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/Config.in                              |  1 +
>  package/perl-sys-meminfo/Config.in             | 10 ++++++++++
>  package/perl-sys-meminfo/perl-sys-meminfo.hash |  6 ++++++
>  package/perl-sys-meminfo/perl-sys-meminfo.mk   | 12 ++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/perl-sys-meminfo/Config.in
>  create mode 100644 package/perl-sys-meminfo/perl-sys-meminfo.hash
>  create mode 100644 package/perl-sys-meminfo/perl-sys-meminfo.mk

You had a license file, but the LICENSE variable was empty, which was
not good. I added a value for the LICENSE variable, and applied to
next. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
