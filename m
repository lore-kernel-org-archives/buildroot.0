From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Oct 2009 23:28:13 +0200
Subject: [Buildroot] [PATCH 1/6] atmel mirrors are only needed for
	atmeltargets
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901DB7951@mi8nycmail19.Mi8.com>
	(H. Hartley Sweeten's message of "Tue\,
	6 Oct 2009 17\:13\:33 -0400")
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<87fx9w1bbc.fsf@macbook.be.48ers.dk>
	<BD79186B4FD85F4B8E60E381CAEE190901DB7951@mi8nycmail19.Mi8.com>
Message-ID: <877hv81ac2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> On Tuesday, October 06, 2009 2:07 PM, Peter Korsgaard wrote:
 Bernhard> Usually, just add your country code like XX here:
 Bernhard> http://ftp.XX.debian.org
 Bernhard> -
 Bernhard> +if BR2_TARGET_ATMEL
 Bernhard> source	"target/device/Atmel/Config.in.mirrors"
 Bernhard> -
 >> 
 >> Committed, thanks!

 H> Hello Peter,

 H> Shouldn't there be a whitespace line before the 'if' and after the 'endif'?
 H> The end of Config.in.mirrors now looks like this:

Kconfig doesn't seem to complain, but I agree it looks cleaner - Will
fix.

-- 
Bye, Peter Korsgaard
