From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 21 Jul 2011 05:48:51 -0500
Subject: [Buildroot] ccache directory
In-Reply-To: <20110721075819.5a535238@skate>
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <87livs1xv4.fsf@macbook.be.48ers.dk> <20110721075819.5a535238@skate>
Message-ID: <201107210548.53315.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu July 21 2011, Thomas Petazzoni wrote:
> Le Wed, 20 Jul 2011 22:49:19 +0200,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
> 
> > Or simply drop the custom ccache location and let people set CCACHE_DIR
> > if they don't like the default (and hence expected) ~/.ccache location.
> 
> That's another possibility, but I find it quite confusing to have some
> parameters set by environment variables, and some other by
> configuration options.
> 

And if one of the purposes of having a programmed build system is to
provide a reproducible build at some future time (or place or by someone else);
setting an environment variable leaves no record in the stored build system.

Mike
> Thomas
