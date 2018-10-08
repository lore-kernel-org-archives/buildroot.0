From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:24:14 +0200
Subject: [Buildroot] [PATCH 01/20] perl-class-inspector: new package
In-Reply-To: <20181006165524.23778-2-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-2-francois.perrad@gadz.org>
Message-ID: <20181008102414.46addeb2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:05 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                                   |  1 +
>  package/perl-class-inspector/Config.in              |  6 ++++++
>  .../perl-class-inspector/perl-class-inspector.hash  |  6 ++++++
>  .../perl-class-inspector/perl-class-inspector.mk    | 13 +++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/perl-class-inspector/Config.in
>  create mode 100644 package/perl-class-inspector/perl-class-inspector.hash
>  create mode 100644 package/perl-class-inspector/perl-class-inspector.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
