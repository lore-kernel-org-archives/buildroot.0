From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Sep 2009 17:48:24 +0200
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <d6cda7730909240842r2fc6d565hde24128fb166dd55@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Thu\, 24 Sep 2009
	12\:42\:03 -0300")
References: <4AB9F39B.4090300@mimc.co.uk> <874oqurm9z.fsf@macbook.be.48ers.dk>
	<4AB9FE2D.1080009@mimc.co.uk> <87my4lrke1.fsf@macbook.be.48ers.dk>
	<4ABA02F3.6020706@mimc.co.uk> <87eipxrfz0.fsf@macbook.be.48ers.dk>
	<4ABB4F13.9060102@mimc.co.uk>
	<d6cda7730909240842r2fc6d565hde24128fb166dd55@mail.gmail.com>
Message-ID: <87tyysgx87.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> I didn't check, but I do remember that there was a clean up where the
 Thiago> atngw100 variations were removed. I think there is only
 Thiago> atngw100_defconfig now.

No, the _base defconfig is still there.

find -name \*base\*defconfig
./Atmel/atngw100-base/atngw100-base_defconfig

-- 
Bye, Peter Korsgaard
