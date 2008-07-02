From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 2 Jul 2008 09:33:51 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb/6.7.1
References: <20080701214725.7525C3C684@busybox.net>
	<d6cda7730807012312l2448b678m958b17d5bf2f7541@mail.gmail.com>
	<d6cda7730807012352q548b6e2aj804f6caf0449ec1a@mail.gmail.com>
Message-ID: <59C3698F62794EECA401B838BFF41356@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Original Message ----- 
From: "Thiago A. Corr?a" <thiago.correa@gmail.com>
To: <buildroot@uclibc.org>
Cc: "Ulf Samuelsson" <ulf@atmel.com>
Sent: Wednesday, July 02, 2008 8:52 AM
Subject: Re: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb/6.7.1


>>    Could you upload the avr32 prepatched gdb 6.7.1 to the at91
>> mirror? It's available at the avr32linux.org:
>> http://avr32linux.org/twiki/bin/view/Main/GDBPatches
>>
>
>
> Nevermind. I didn't see it before, but it's there. I just had to edit
> target/devices/Config.in.toolchain and fix the patch version number.
>

Yes it has been there for some months.
If you need to apply some patches, then you can do that in
target/device/Atmel/toolchain

/Ulf

> Sorry for the confusion.
>
