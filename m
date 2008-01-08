From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 8 Jan 2008 13:44:51 -0200
Subject: [Buildroot] The target/device/Atmel mess
In-Reply-To: <d6cda7730801070923n74d20a21k6d5a1205c2592dbf@mail.gmail.com>
References: <d6cda7730712241147g3e1edd25jcc11fcece24e4ec9@mail.gmail.com>
	<d6cda7730801040506h364041e7l5c58d90c3c708d6f@mail.gmail.com>
	<028d01c85141$ba1a0290$030514ac@atmel.com>
	<d6cda7730801070923n74d20a21k6d5a1205c2592dbf@mail.gmail.com>
Message-ID: <d6cda7730801080744g579c2d19wc1fb16b76ff431ee@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I have named the folder arch-avr32/kernel-patches-2.6.23
> Should it be kernel-patches-2.6.23.0?
> Usually the same patch applies to all minor versions, (ie: 2.6.22.0 to
> 2.6.22.10), how does one express that?

Replying to myself, yes, it should be called kernel-patches-2.6.23.0
to apply. The other issues are still open though, such as the
apparently unused Linux folder :(

Ulf, anyone?

Kind Regards,
   Thiago A. Correa
