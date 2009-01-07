From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jan 2009 14:15:15 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231331663.32308.358.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 07 Jan 2009 13\:34\:23 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<1231268529.32308.222.camel@elrond.atmel.com>
	<87y6xomehq.fsf@macbook.be.48ers.dk>
	<1231274947.32308.260.camel@elrond.atmel.com>
	<87ljtnl5g9.fsf@macbook.be.48ers.dk>
	<1231331663.32308.358.camel@elrond.atmel.com>
Message-ID: <874p0bl0kc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> You need several for distributions (or releases) to work
 >> 
 >> Why? If big distributions like Debian can use the same sources for all
 >> it's archs, why can't we?

 Ulf> We need to differentiate between testing and releases.
 Ulf> I have already made the comment, that I believe 
 Ulf> a distribution should use a single version of the source
 Ulf> (with patches).

 Ulf> I am talking about the process of getting a package
 Ulf> into the stable distribution, and currently there
 Ulf> is no process of doing this.
 Ulf> Either you commit a patch or not.
 Ulf> As you pointed out, we do not have the resources
 Ulf> to do every test for every architecture.

That's what the releases are for. We do development for some time,
then move into a stabilization phase (release candidates) and finally
we do a release. Then the cyclus starts again.

 Ulf> Unless we can commit patches to a development section
 Ulf> without breaking the distribution we cannot work 
 Ulf> as a team.

Why not? It seems to work elsewhere, and obviously seems to have
worked here pretty ok as well.

 Ulf> Your goal of a single source package that will not break
 Ulf> for any supported architecture will thus be met by the 
 Ulf> packages IN the distribution. Packages outside
 Ulf> the distribution are not supported.

packages outside the distribution? What are those?

 Ulf> It will also allow people to build old distributions.

They always can do that, just use an old release.

-- 
Bye, Peter Korsgaard
