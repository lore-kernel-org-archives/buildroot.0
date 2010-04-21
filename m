From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Apr 2010 20:46:14 +0200
Subject: [Buildroot] Still can't build
	workingrootfswith	crosstool-NGtoolchain
In-Reply-To: <hqngcu$47r$1@dough.gmane.org> (Grant Edwards's message of "Wed, 
	21 Apr 2010 18:33:02 +0000 (UTC)")
References: <hqhq8e$uau$1@dough.gmane.org>
	<8D63FCBEC4B04D56B92C74260683A038@development>
	<028801cae0e3$3ebe5720$bc3b0560$@com>
	<5D7DDABC417D46CFACF64003BB0EBC2F@development>
	<hqn0op$14i$1@dough.gmane.org>
	<82069254E03F44CB90EDB741DB18CBF9@development>
	<hqn98s$5sn$1@dough.gmane.org>
	<8035C465416D4C9D8992B2CB364F236E@development>
	<hqngcu$47r$1@dough.gmane.org>
Message-ID: <87ochc7ifd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 Grant> AFAIK, most of the buildroot developers use external toolchains
 Grant> built by crosstools-NG (and that's what I'm now using), so
 Grant> that's probably the path of least resistance.  If you like, I
 Grant> can send you the crosstools-NG and uClibc config files I'm using
 Grant> for ARM9, but Crosstools-NG comes with quite a few sample
 Grant> configs -- one of them is probably pretty close to what you
 Grant> want.

Not me. I still use an internal toolchain (but will probably move to
ct-NG once the kinks are sorted out).

-- 
Bye, Peter Korsgaard
