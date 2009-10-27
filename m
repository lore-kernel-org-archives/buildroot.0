From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Oct 2009 17:36:57 +0100
Subject: [Buildroot] [PATCH] Fix TARGET_PATH variable with external
	toolchain
In-Reply-To: <1256638654.32194.44.camel@coalu.atr> (Lionel Landwerlin's
	message of "Tue\, 27 Oct 2009 11\:17\:34 +0100")
References: <1256342684.28475.5.camel@coalu.atr>
	<87ljj0zlh6.fsf@macbook.be.48ers.dk> <20091027084428.6132b429@surf>
	<1256636707.32194.7.camel@coalu.atr> <20091027105329.0cc61c47@surf>
	<1256638654.32194.44.camel@coalu.atr>
Message-ID: <87fx94dc9i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

Hi,

 Lionel> By the way, is there a set of configuration files that cover
 Lionel> the list of package that are known to work with buildroot ?

Not a complete list, no. In concept, we would like all packages to work,
but as the number of combinations with 600+ packages / 5+ archs is so
high, there's bound to be issues.

 Lionel> It could be interesting to setup some kind of non regression builds :)

Certainly. I have a buildbot instance running at where I work to test
the configs we're using, and I'm planning on setting up a public
buildbot soon.

I recently added make all{yes,no,random}packageconfig targets to make it
easier to test random package combinations.

-- 
Bye, Peter Korsgaard
