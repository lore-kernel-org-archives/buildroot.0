From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:43:03 +0200
Subject: [Buildroot] [PATCH 03/18] perl-data-dump: new package
In-Reply-To: <20180820115519.24046-4-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-4-chrismcc@gmail.com>
Message-ID: <20180912214303.0809cb39@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:55:04 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/perl-data-dump/Config.in           |  6 ++++++
>  package/perl-data-dump/perl-data-dump.hash |  6 ++++++
>  package/perl-data-dump/perl-data-dump.mk   | 13 +++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/perl-data-dump/Config.in
>  create mode 100644 package/perl-data-dump/perl-data-dump.hash
>  create mode 100644 package/perl-data-dump/perl-data-dump.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
