From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 May 2009 19:06:17 +0200
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <d6cda7730905080959j711986b7t181ac09c81d2475c@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Fri\, 8 May 2009
	13\:59\:36 -0300")
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<877i0scbjf.fsf@macbook.be.48ers.dk>
	<d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
	<87hbzwatgw.fsf@macbook.be.48ers.dk>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
	<d6cda7730905080356i3e2db098yc8d3cc66c41f6ac7@mail.gmail.com>
	<d6cda7730905080959j711986b7t181ac09c81d2475c@mail.gmail.com>
Message-ID: <877i0ra5iu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> It turns out I was a bit too tired and thought I tested it
 Thiago> with 2.6.29 kernel headers and < 2.6.29 kernel.

;)

 Thiago> iptables can't build with toolchain kernel headers earlier
 Thiago> than 2.6.29 under avr32, what actually fixed the build was
 Thiago> the atngw100_defconfig update. Good thing I removed that "fix
 Thiago> iptables" bit from the logs :D

Ok, that makes a bit more sense ;)

-- 
Bye, Peter Korsgaard
