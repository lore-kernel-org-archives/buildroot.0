From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 27 Aug 2007 16:50:48 +0100
Subject: [Buildroot] [Fwd: Re: Struggling with undefined reference to
	`__fgetc_unlocked']
In-Reply-To: <1188222485.7840.44.camel@localhost.localdomain>
References: <46CDB91F.80307@st.com>
	<d6cda7730708230953y52b03167t55d124cb50b67603@mail.gmail.com>
	<46CDBC95.7040803@st.com>
	<d6cda7730708231025t391a2263xed883aa16e1a8e84@mail.gmail.com>
	<20070823201759.GO11697@aon.at>
	<1188211076.7840.5.camel@localhost.localdomain>
	<d6cda7730708270633g41662ec3h345cd0fb256756c1@mail.gmail.com>
	<1188222485.7840.44.camel@localhost.localdomain>
Message-ID: <d6cda7730708270850v17f51748lf0a6ade2e0a10b53@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I have a patch for the missing qatomic_avr32.h file, I think I posted it
> to this list.
>
> Anyway, I have attached it to this email as well.

I can't belive I neglected that, I guess sleep deprivation does this :P
I haven't seen it on the list (I have joined about a week ago anyway),
but I did see it in the Atmel snapshot. I suppose it would be best to
append it to the patch file that adds avr32 support to qtopia.

Wonder if patch can patch a patch file :P

I will resubmit the qtopia patch I sent earlier.

>
> >     Still on the Qtopia subject, one has to do LIBS -= -ldl in a
> > qtopia project to be able to link. Linker complains about undefined
> > symbols. This I have been trying to fix since friday with no success,
> > so I took the easy path in my project for now, not linking against
> > libdl.so
>
> Weird, I did not have to supply that on my workstation and test server.
> (From a completely clean Ubuntu installation (without any AVR32 stuff)).
>
> --
> With kind regards,
> Hans-Christian Egtvedt, Applications Engineer
>
>
