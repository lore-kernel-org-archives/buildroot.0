From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 24 Sep 2007 16:34:34 +0100
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <1190646805.7015.149.camel@elrond.atmel.sweden>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
	<d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
	<1190600185.4299.44.camel@cyclops.infocab.com.au>
	<d6cda7730709232043k2d85bb2bi8318ef6f652a1eff@mail.gmail.com>
	<1190606113.22869.5.camel@cyclops.infocab.com.au>
	<20070924081339.GA31515@aon.at>
	<d6cda7730709240559nb93d524wcab63f2ee4e6c13a@mail.gmail.com>
	<20070924132226.GC1335@aon.at>
	<1190646805.7015.149.camel@elrond.atmel.sweden>
Message-ID: <d6cda7730709240834j5ced5e54tc3bec656c406858e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/24/07, Ulf Samuelsson <ulf@atmel.com> wrote:
>
> Maybe it is a good idea to fix things in a controlled manner.
> Have you tested your patch against anything, to see what
> it actually breaks, was it just a whim?

Ulf, do you mean my proposed change? Not really. Right now I was
trying to grep for mplayer sources to find the index or rindex, but
could only find it in win32 code. Next step would be to try to
reproduce Adam's build of mplayer.

I can give it a shot in uClib, surely would make it more robust. But
Bernard is right that using that API is just plain wrong, so if I can
find it in mplayer, I'm reporting or sending a patch their way.

> Why not turn off everything in uclibc.config as well?

I was considering toying with buildbot to do automated build tests of
buildroot. But then I realised that I have screwed my system more than
once installing uClib into the /lib rather than the target folder
*smile*.

Regards,
   Thiago A. Correa
