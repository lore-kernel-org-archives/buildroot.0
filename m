From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:51:17 +0200
Subject: [Buildroot] [PATCH 3/3] perl-xml-libxml: new package
In-Reply-To: <1403547286-8858-3-git-send-email-francois.perrad@gadz.org>
References: <1403547286-8858-1-git-send-email-francois.perrad@gadz.org>
 <1403547286-8858-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140629105117.23bcfa14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Mon, 23 Jun 2014 20:14:46 +0200, Francois Perrad wrote:
> and its CPAN dependencies
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                                          |  4 ++++
>  package/perl-xml-libxml/Config.in                          | 10 ++++++++++
>  package/perl-xml-libxml/perl-xml-libxml.mk                 | 14 ++++++++++++++
>  package/perl-xml-namespacesupport/Config.in                |  6 ++++++
>  .../perl-xml-namespacesupport/perl-xml-namespacesupport.mk | 13 +++++++++++++
>  package/perl-xml-sax-base/Config.in                        |  6 ++++++
>  package/perl-xml-sax-base/perl-xml-sax-base.mk             | 13 +++++++++++++
>  package/perl-xml-sax/Config.in                             |  8 ++++++++
>  package/perl-xml-sax/perl-xml-sax.mk                       | 14 ++++++++++++++
>  9 files changed, 88 insertions(+)
>  create mode 100644 package/perl-xml-libxml/Config.in
>  create mode 100644 package/perl-xml-libxml/perl-xml-libxml.mk
>  create mode 100644 package/perl-xml-namespacesupport/Config.in
>  create mode 100644 package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
>  create mode 100644 package/perl-xml-sax-base/Config.in
>  create mode 100644 package/perl-xml-sax-base/perl-xml-sax-base.mk
>  create mode 100644 package/perl-xml-sax/Config.in
>  create mode 100644 package/perl-xml-sax/perl-xml-sax.mk

I've applied these packages after splitting your patch in four patches,
one per package, as suggested by Arnout.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
