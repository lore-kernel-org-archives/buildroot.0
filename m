From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Apr 2008 15:45:52 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <d6cda7730804250631nf9ea783y8fb70640c7bfba98@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Fri\, 25 Apr 2008
	10\:31\:48 -0300")
References: <20080424184430.B4D613C849@busybox.net>
	<1209108213.2859.9.camel@localhost>
	<d6cda7730804250631nf9ea783y8fb70640c7bfba98@mail.gmail.com>
Message-ID: <87iqy6vyi7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> $(STRIP) doesn't exist, and now that the patch was reverted, it
 Thiago> doesn't work, as opposed to working. So, it seams fixing whitespace
 Thiago> damage is more important than producing a working binary.

Ofcause not, but random unneeded changes aren't particular welcome
either. Your changelog didn't mention anything about STRIP though.

Anyway, several of the recent commits are broken in this regard. I
have fixed qtopia4, oprofile, dummy and webif in r21859.

-- 
Bye, Peter Korsgaard
