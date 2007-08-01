From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 1 Aug 2007 09:45:57 +0200
Subject: [Buildroot] Qtopia4 fails building - target stage tries to
	run	target binaries on build machine
In-Reply-To: <1185892878.1675.6.camel@localhost.localdomain>
References: <1185796725.27015.7.camel@localhost.localdomain>
	<20070730185416.GA23362@zelow.no>
	<1185870123.14026.4.camel@localhost.localdomain>
	<20070731093827.GA18869@zelow.no>
	<37c712e0707310526n3e3a8c64v33b7717bad6fd464@mail.gmail.com>
	<1185885318.24720.3.camel@localhost.localdomain>
	<37c712e0707310727r2870246ei3cdeb275c7e21bb4@mail.gmail.com>
	<1185892878.1675.6.camel@localhost.localdomain>
Message-ID: <20070801074557.GB20580@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 31, 2007 at 04:41:18PM +0200, Hans-Christian Egtvedt wrote:
> 
> The Qtopia 4 source is extracted to two different places and compiled
> almost alike. As I see it, one time should be enough.

but it isn't. one reason is the hard coding of paths in the qt
libraries.

there was other reasons aswell but I can't remember all of'em just right
now.

it's been too long time without having to work on it.

> > 2) running qmake and moc for the target
> 
> Do buildroot need this? Only if they are to be installed on target and
> the user plans to build QT application on the target.

you need qmake & friends on the host to compile applications for the
target.

if that was the question.

> AFAIK Qtopia 4 is somewhat ready for cross compiling, capable of
> building the tools with HOSTCC and the library with TARGETCC.

somewhat is the word here.



Thomas.
