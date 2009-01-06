From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 19:33:59 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 6 Jan 2009
	16\:22\:17 -0200")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
Message-ID: <877i58nv1k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> I offer to do something about both: Take over maintainership and get
 >> atual stable releases out the door (if Erik and the other developers
 >> agree).

 Thiago> I for one welcome our new maintainer overlord.
 Thiago> Seriously, for what it's worth, you have my support.

Great, thanks.

 Thiago> AVR32 has been recently broken (again). I would much prefer
 Thiago> that changes were reverted (termporarily or not) and have
 Thiago> AVR32 in this "release" rather than deem it BROKEN.

What changes are those exactly?

 Thiago> Maybe we could get a buildbot going. Then we can let many of the
 Thiago> developers/uses here contribute cpu cycle to build tests.

Yes, I have been pondering that as well. I have a buildbot running at
work for the platforms we're using with good results, but it's a
question about coming up with varying enough configs to get good test
coverage.

 Thiago> The problem with qemu is that it will only cover some
 Thiago> platforms that it supports, and unfortunally for me, it
 Thiago> doesn't support AVR32 :(

Sure, if you have access to suitable hw, then that's better than qemu,
but if not, then qemu is nice for the platforms it support.

-- 
Bye, Peter Korsgaard
