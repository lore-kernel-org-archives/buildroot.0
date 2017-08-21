From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Aug 2017 21:38:02 +0200
Subject: [Buildroot] [PATCH 09/18] perl-net-dns: bump to version 1.12
In-Reply-To: <20170820080331.12935-9-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
 <20170820080331.12935-9-francois.perrad@gadz.org>
Message-ID: <3015bde1-cfbd-8cc4-f6ba-28ce06957120@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-08-17 10:03, Francois Perrad wrote:
> diff --git a/package/perl-net-dns/Config.in b/package/perl-net-dns/Config.in
> index de720bf25..c156505c7 100644
> --- a/package/perl-net-dns/Config.in
> +++ b/package/perl-net-dns/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_NET_DNS
>  	help
>  	  Perl Interface to the Domain Name System
>  
> -	  http://www.net-dns.org
> +	  https://metacpan.org/release/Net-DNS


 Why change the upstream URL? net-dns.org still seems relevant...

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
