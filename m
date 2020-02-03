From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 23:27:53 +0100
Subject: [Buildroot] [PATCH 2/2] package/haproxy: bump to version 2.1.2
In-Reply-To: <20200203205256.2508469-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 3 Feb 2020 21:52:56 +0100")
References: <20200203205256.2508469-1-fontaine.fabrice@gmail.com>
 <20200203205256.2508469-2-fontaine.fabrice@gmail.com>
Message-ID: <87wo93z4pi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/haproxy/haproxy.hash | 4 ++--
 >  package/haproxy/haproxy.mk   | 4 ++--
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
 > index 87a29eeba1..7f03e88d43 100644
 > --- a/package/haproxy/haproxy.hash
 > +++ b/package/haproxy/haproxy.hash
 > @@ -1,5 +1,5 @@
 > -# From: http://www.haproxy.org/download/2.0/src/haproxy-2.0.10.tar.gz.sha256
 > -sha256 1d38ab3dd45e930b209e922a360ee8c636103e21e5b5a2656d3795401316a4ea haproxy-2.0.10.tar.gz
 > +# From: http://www.haproxy.org/download/2.1/src/haproxy-2.1.2.tar.gz.sha256
 > +sha256	6079b08a8905ade5a9a2835ead8963ee10a855d8508a85efb7181eea2d310b77	haproxy-2.1.2.tar.gz
 >  # Locally computed:
 >  sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
 >  sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
 > diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
 > index 88247d8e63..5485954a1f 100644
 > --- a/package/haproxy/haproxy.mk
 > +++ b/package/haproxy/haproxy.mk
 > @@ -4,8 +4,8 @@
 >  #
 >  ################################################################################
 
 > -HAPROXY_VERSION_MAJOR = 2.0
 > -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).10
 > +HAPROXY_VERSION_MAJOR = 2.1
 > +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).2

Sorry, I wasn't fast enough to reply to this before it was merged - But
according to the website, the 2.0.x series is a LTS series, and 2.1.x
isn't - So moving away from 2.0.x just before our new LTS series is
perhaps not such a great idea?

See the table on https://www.haproxy.org/

-- 
Bye, Peter Korsgaard
