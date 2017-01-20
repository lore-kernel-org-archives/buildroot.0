From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 20:39:58 +0100
Subject: [Buildroot] [PATCH 06/12] perl-net-dns: bump to version 1.07
In-Reply-To: <1484904605-11239-6-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Fri, 20 Jan 2017 10:29:59 +0100")
References: <1484904605-11239-1-git-send-email-francois.perrad@gadz.org>
 <1484904605-11239-6-git-send-email-francois.perrad@gadz.org>
Message-ID: <8760l9sepd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/perl-net-dns/Config.in         | 4 ++--
 >  package/perl-net-dns/perl-net-dns.hash | 4 ++--
 >  package/perl-net-dns/perl-net-dns.mk   | 2 +-
 >  3 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/package/perl-net-dns/Config.in b/package/perl-net-dns/Config.in
 > index 24ce481..c156505 100644
 > --- a/package/perl-net-dns/Config.in
 > +++ b/package/perl-net-dns/Config.in
 > @@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_NET_DNS
 >  	bool "perl-net-dns"
 >  	select BR2_PACKAGE_PERL_DIGEST_HMAC
 >  	help
 > -	  Net::DNS is a DNS resolver implemented in Perl.
 > +	  Perl Interface to the Domain Name System
 
 > -	  http://www.net-dns.org
 > +	  https://metacpan.org/release/Net-DNS

The old homepage is IMHO better. It seems much more detailed, so I've
kept it and committed patches 1-11, thanks.

-- 
Bye, Peter Korsgaard
