From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:25:22 +0200
Subject: [Buildroot] [PATCH 15/20] perl-cookie-baker: new package
In-Reply-To: <20181006165524.23778-16-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-16-francois.perrad@gadz.org>
Message-ID: <20181008122522.72bd1730@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:19 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                                |  1 +
>  package/perl-cookie-baker/Config.in              |  7 +++++++
>  package/perl-cookie-baker/perl-cookie-baker.hash |  6 ++++++
>  package/perl-cookie-baker/perl-cookie-baker.mk   | 14 ++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/perl-cookie-baker/Config.in
>  create mode 100644 package/perl-cookie-baker/perl-cookie-baker.hash
>  create mode 100644 package/perl-cookie-baker/perl-cookie-baker.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
