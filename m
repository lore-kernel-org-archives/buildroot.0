From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 7 Mar 2009 23:20:36 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <878wnie4ab.fsf@macbook.be.48ers.dk>
References: <20090303220951.E40FB7626F@busybox.osuosl.org>
	<d6cda7730903060956r6a3c5fe8ra2ee09251ce81d61@mail.gmail.com>
	<878wnie4ab.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730903071820v7ba666ej2745c45f7d6ccf23@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> ?Thiago> This breaks AVR32 external toolchain thing. I tried to make it:
> ?Thiago> depends on BR2_DEPRECATED if !BR2_avr32
>
> ?Thiago> but it didn't work, looks like kconfig doesn't accept ! logic
> ?Thiago> with depends
>
> I think depends on BR2_DEPRECATED || BR2_avr32 works.
> Sorry, I keep on forgetting about avr32 being so special.
> I'll fix it.

Thanks, it's fixed now.

>
> How's avr32 support for newer binutils/gcc going?
>

I wish I knew. I've asked Atmel's support twice already to forward it
as a "customer wish", in a hope that they would speed up (or actually
start), but it was to no avail so far.

I guess all I can do now is keep my fingers crossed.
