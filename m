From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Aug 2017 21:39:17 +0200
Subject: [Buildroot] [PATCH 14/18] perl-uri: bump to version 1.72
In-Reply-To: <20170820080331.12935-14-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
 <20170820080331.12935-14-francois.perrad@gadz.org>
Message-ID: <5bcf74a0-1bbb-6cff-f2a8-a7f08af08997@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-08-17 10:03, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-uri/Config.in     | 6 ++----
>  package/perl-uri/perl-uri.hash | 4 ++--
>  package/perl-uri/perl-uri.mk   | 2 +-
>  3 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/package/perl-uri/Config.in b/package/perl-uri/Config.in
> index 62a53f248..23e5c50e0 100644
> --- a/package/perl-uri/Config.in
> +++ b/package/perl-uri/Config.in
> @@ -1,8 +1,6 @@
>  config BR2_PACKAGE_PERL_URI
>  	bool "perl-uri"
>  	help
> -	  The module implements the URI class. Objects of this class represent
> -	  Uniform Resource Identifier references as specified in RFC 2396 and
> -	  updated by RFC 2732.
> +	  Uniform Resource Identifiers (absolute and relative)

 Why reduce this informative help message to something so terse?


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
