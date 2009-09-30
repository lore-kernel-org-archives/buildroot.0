From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 30 Sep 2009 13:44:22 +0200
Subject: [Buildroot] multiple architectures
In-Reply-To: <5f2b60909300320s49960173x193b324f432f7aef@mail.gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Wed\, 30 Sep 2009
	12\:20\:30 +0200")
References: <20090930062658.GG25852@moomers.org> <20090930090102.0189852d@surf>
	<5f2b60909300113o53ef97b7j6910562af6ebb8be@mail.gmail.com>
	<20090930103137.304aa012@surf>
	<5f2b60909300320s49960173x193b324f432f7aef@mail.gmail.com>
Message-ID: <87eipoodwp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

Hi,

 Bj?rn> I realize now that it takes more than a simple output-ARCH
 Bj?rn> directory, so I'd like to keep the current functionality with
 Bj?rn> O=.  (Because BR should not be as complex as OE!)

Indeed. I think one of the main advantages BR has over OE is
simplicity - We should always keep that in mind before adding new
features.

-- 
Bye, Peter Korsgaard
