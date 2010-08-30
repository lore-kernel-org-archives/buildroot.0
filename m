From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Aug 2010 22:00:21 +0200
Subject: [Buildroot] Make 3.82 does behave differently than make
	3.81	for sure, but ...
In-Reply-To: <20100830163153.GA12776@merkur.ravnborg.org> (Sam Ravnborg's
	message of "Mon, 30 Aug 2010 18:31:53 +0200")
References: <4C7B99D5.9010703@jdines.net> <87bp8kxlve.fsf@macbook.be.48ers.dk>
	<4C7BC441.3010006@jdines.net>
	<201008301701.22856.yann.morin.1998@anciens.enib.fr>
	<4C7BD1D6.5070100@jdines.net>
	<20100830163153.GA12776@merkur.ravnborg.org>
Message-ID: <8739tvyip6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sam" == Sam Ravnborg <sam@ravnborg.org> writes:

Hi,

 Sam> make 3.81 accept the following:

 Sam> foo foo%: bar
 Sam> 	command

 Sam> With make 3.82 you need to split this up as:

 Sam> foo: bar
 Sam> 	command

 Sam> foo%: bar
 Sam> 	command

Yeah, saw the kernel changes passing by. I haven't had time to test
building with make 3.82 yet though (it's not in Debian yet), so we might
have something similar lingering around somewhere ..

-- 
Bye, Peter Korsgaard
