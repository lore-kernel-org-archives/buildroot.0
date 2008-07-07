From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 19:39:55 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707152546.GH15840@mx.loc> (Bernhard Fischer's message of
	"Mon\, 7 Jul 2008 17\:25\:46 +0200")
References: <20080704222950.E76B63C61F@busybox.net>
	<87fxqmg53j.fsf@macbook.be.48ers.dk> <48720878.3070602@atmel.com>
	<20080707123642.GA15840@mx.loc> <87ej654uuu.fsf@macbook.be.48ers.dk>
	<20080707152546.GH15840@mx.loc>
Message-ID: <878wwd1tlg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

(will look into the makefile stuff later)

 >> external-deps doesn't work like it does for the other packages.

 Bernhard> My lack of interrest to support external stuff is deep and profound.

external-deps has nothing to do with external toolchains. It simply
gives you the list of packages in $DL_DIR you'll need to archive
together with your buildroot snapshot to be able to reproduce your
build.

-- 
Bye, Peter Korsgaard
