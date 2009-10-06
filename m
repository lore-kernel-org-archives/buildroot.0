From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Oct 2009 20:32:27 +0200
Subject: [Buildroot] [PATCH 1/6] atmel mirrors are only needed for atmel
	targets
In-Reply-To: <1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	(Bernhard Reutner-Fischer's message of "Tue\,
	6 Oct 2009 20\:26\:03 +0200")
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
Message-ID: <87my442x1g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard>  	  Usually, just add your country code like XX here:
 Bernhard>  	  http://ftp.XX.debian.org
 Bernhard> -
 Bernhard> +if BR2_TARGET_ATMEL
 Bernhard>  source	"target/device/Atmel/Config.in.mirrors"
 Bernhard> -

OK.

-- 
Bye, Peter Korsgaard
