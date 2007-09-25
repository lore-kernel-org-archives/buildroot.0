From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 26 Sep 2007 00:05:41 +0200
Subject: [Buildroot] native GCC not found in HEAD
In-Reply-To: <1190747162.19731.100.camel@elrond.atmel.sweden>
References: <d6cda7730709250656u4b67c688q4f4e5fe83ce32571@mail.gmail.com>
	<02ca01c7ff9f$46e23020$dcc4af0a@atmel.com>
	<d6cda7730709251133u591f038rf80cdb0bdd6d8614@mail.gmail.com>
	<1190747162.19731.100.camel@elrond.atmel.sweden>
Message-ID: <20070925220541.GM20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 25, 2007 at 09:06:02PM +0200, Ulf Samuelsson wrote:
>tis 2007-09-25 klockan 19:33 +0100 skrev Thiago A. Corr?a:
>> I have also noticed that the folder names don't have the avr32 suffix
>> anymore, so I guess it's a variable that is not right.
>> 
>
>
>> Also, there is no more Buildroot toolchain, only external toolchain in
>> the options. Is this really expected? Something wrong with using
>> buildroot toolchain? or part of the problem? There is some 300
>> revisions between what used to work and HEAD *sigh*
>> 
>
>Yes, all the version info for gcc,binutils,uclibc etc. are gone
>with Bernhards changes.

The logic in your target/device/Toolchain.in looks a bit flawed to my
untrained eyes.

>That is why you have a problem.

Exactly. r20029 removes this problem.
