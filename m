From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 01:58:19 -0500
Subject: [Buildroot] [PATCH] package/perl-net-snmp: remove 'v' prefix
 from github-fetched packages
In-Reply-To: <20191027064623.15221-1-matthew.weber@rockwellcollins.com>
References: <20191027064623.15221-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpZA1v-H=QLzzRNEszV=eBQ5y0MjUSVo9g5TeZmyAoRC=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Title of this one can drop the github part (cut/paste error)

On Sun, Oct 27, 2019 at 1:46 AM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Fixes version parsing for release-monitoring.org support.
>
> Cc: Heiko Thiery <heiko.thiery@kontron.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/perl-net-snmp/perl-net-snmp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/perl-net-snmp/perl-net-snmp.mk b/package/perl-net-snmp/perl-net-snmp.mk
> index ae8607e406..36b50d6358 100644
> --- a/package/perl-net-snmp/perl-net-snmp.mk
> +++ b/package/perl-net-snmp/perl-net-snmp.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -PERL_NET_SNMP_VERSION = v6.0.1
> -PERL_NET_SNMP_SOURCE = Net-SNMP-$(PERL_NET_SNMP_VERSION).tar.gz
> +PERL_NET_SNMP_VERSION = 6.0.1
> +PERL_NET_SNMP_SOURCE = Net-SNMP-v$(PERL_NET_SNMP_VERSION).tar.gz
>  PERL_NET_SNMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DT/DTOWN
>  PERL_NET_SNMP_DEPENDENCIES = host-perl-module-build
>  PERL_NET_SNMP_LICENSE = Artistic or GPL-1.0+
> --
> 2.17.1
>


-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
