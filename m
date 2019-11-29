From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:04:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/mii-diag: add an upstream URL
 to Config.in
In-Reply-To: <20191128163847.28796-1-mark@dibsco.co.uk> (Mark Corbin's message
 of "Thu, 28 Nov 2019 16:38:47 +0000")
References: <20191128163847.28796-1-mark@dibsco.co.uk>
Message-ID: <87lfrzdpec.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark@dibsco.co.uk> writes:

 > Add an upstream URL to the help text in Config.in. This
 > addresses the 'Missing' URL status in the package stats
 > web page output.

 > Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
 > ---
 >  package/mii-diag/Config.in | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/mii-diag/Config.in b/package/mii-diag/Config.in
 > index ca48ba216f..37f3647bb9 100644
 > --- a/package/mii-diag/Config.in
 > +++ b/package/mii-diag/Config.in
 > @@ -3,3 +3,5 @@ config BR2_PACKAGE_MII_DIAG
 >  	help
 >  	  mii-diag allows you to manipulate the MII registers of
 >  	  network cards.
 > +
 > +	  https://launchpad.net/ubuntu/+source/mii-diag

I was going to say that we should point to Debian instead as that is
where we get the source code from, but it apparently got removed from
Debian back in 2013:

https://tracker.debian.org/news/392462/bug726552-removed-packages-from-unstable/

So maybe we should get rid of it as well?

Anyway, pointing to Ubuntu is better than nothing, so committed -
Thanks.

-- 
Bye, Peter Korsgaard
