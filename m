From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 24 Sep 2007 11:12:42 +0200
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <1190621530.7015.45.camel@elrond.atmel.sweden>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
	<d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
	<1190600185.4299.44.camel@cyclops.infocab.com.au>
	<d6cda7730709232043k2d85bb2bi8318ef6f652a1eff@mail.gmail.com>
	<1190621530.7015.45.camel@elrond.atmel.sweden>
Message-ID: <20070924091242.GA32094@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 24, 2007 at 10:12:10AM +0200, Ulf Samuelsson wrote:

>I will submit a patch that allows UCLIBC_SUSV3_LEGACY
>to be SED'ed into the uclibc configuration based on
>BR2_UCLIBC_SUSV3_LEGACY (a new makeconfig choice).

Please don't. This is way too fine-grained.
That's exactly the reason why we have
$ make uclibc-menuconfig

This is easy enough.
