From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 25 Jun 2007 10:40:07 +0200
Subject: [Buildroot] gettext breakage on ia32 [was: Re:
	buildroot-20070620.tar.bz2 snapshot issue]
In-Reply-To: <20070623203109.GQ4096@aon.at>
References: <5d75f4610706200238ud163a2jbe00525e00b274a9@mail.gmail.com>
	<1182333923.5719.30.camel@shadow.muzakdomain.imagesound.co.uk>
	<20070620121339.GB28828@aon.at>
	<5d75f4610706230553h7ea29972nd07670adf70cc23a@mail.gmail.com>
	<20070623203109.GQ4096@aon.at>
Message-ID: <20070625084007.GD5134@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 23, 2007 at 10:31:09PM +0200, Bernhard Fischer wrote:
>On Sat, Jun 23, 2007 at 07:53:02PM +0700, BuraphaLinux Server wrote:

>>In file included from plural-eval.c:36:
>>../../gettext-runtime/intl/eval-plural.h:28: error: conflicting types
>>for 'plural_eval'
>>../../gettext-runtime/intl/plural-exp.h:115: error: previous
>>declaration of 'plural_eval' was here
>
>uclibc.org/~aldot/uClibc/uClibc-0.9.29-fix-internal_function-definition.patch

Should be fixed now.
