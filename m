From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 21 Jul 2009 10:09:21 +0200
Subject: [Buildroot] libgcc build error on arm
In-Reply-To: <20090720160320.46ee4d2b@debian.canoga.com>
References: <20090720121200.05b9f0b5@debian.canoga.com>
	<20090720160320.46ee4d2b@debian.canoga.com>
Message-ID: <20090721080921.GA13154@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 20, 2009 at 04:03:20PM -0700, Amit Uttamchandani wrote:
>On Mon, 20 Jul 2009 12:12:00 -0700
>Amit Uttamchandani <amit.uttam@gmail.com> wrote:
>
>> 
>> Using the latest git source I get following build error when building
>> a toolchain for arm (build log can be found at end of message):
>> 
>
>[snip]
>
>Solved by using the following:
>
>Target architecture: arm
>Target architecture variant: generic_arm
>Target ABI: OABI

Still, I recommend using EABI.
