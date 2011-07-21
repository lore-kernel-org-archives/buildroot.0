From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jul 2011 07:58:19 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <87livs1xv4.fsf@macbook.be.48ers.dk>
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <20110720181955.36911f14@skate>
 <87livs1xv4.fsf@macbook.be.48ers.dk>
Message-ID: <20110721075819.5a535238@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 20 Jul 2011 22:49:19 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Or simply drop the custom ccache location and let people set CCACHE_DIR
> if they don't like the default (and hence expected) ~/.ccache location.

That's another possibility, but I find it quite confusing to have some
parameters set by environment variables, and some other by
configuration options.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
