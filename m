From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Jun 2010 22:51:13 +0200
Subject: [Buildroot] package/games/Config.in usage
In-Reply-To: <20100617222716.468feb2e@surf> (Thomas Petazzoni's message of
	"Thu, 17 Jun 2010 22:27:16 +0200")
References: <4C1A1F22.70500@free.fr> <87zkytbwgo.fsf@macbook.be.48ers.dk>
	<20100617222716.468feb2e@surf>
Message-ID: <87mxutbcxq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Me too.

 Thomas> Why not, but in that case, we need non ambiguous names. I'm
 Thomas> referring to the recent introduction of several Lua packages:
 Thomas> some of them have fairly common names:

 Thomas>  http://git.buildroot.net/buildroot/commit/?id=50d6f2dde4db8c9d042294a09d5e8e120aec9987

 Thomas> Maybe they should be named "lua-XXX" instead ?

Yes, sorry I forgot to answer your mail on this. It is not only the
directory name, but also the BR2_PACKAGE_* symbol that need to be
specific enough.

 Thomas> Another strategy would be to mimick in the directory layout the
 Thomas> organization of options in the menuconfig.

I find it quite handy to do a quick cd package/<package> when I need to
fix something in a package, without having to start make menuconfig to
figure out in what sub directory it is - The current package/multimedia
stuff kind of bothers me.

-- 
Bye, Peter Korsgaard
