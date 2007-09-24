From: Adam Hawes <adam@infocab.com.au>
Date: Mon, 24 Sep 2007 13:25:13 +0930
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <d6cda7730709232043k2d85bb2bi8318ef6f652a1eff@mail.gmail.com>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
	<d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
	<1190600185.4299.44.camel@cyclops.infocab.com.au>
	<d6cda7730709232043k2d85bb2bi8318ef6f652a1eff@mail.gmail.com>
Message-ID: <1190606113.22869.5.camel@cyclops.infocab.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>    You are fixing newer, valid and good code in the name of legacy
> compatibility with a flawed work around for legacy API. The simple
> fact that there are more than one way around it doesn't make the patch
> the better way. And I think we should strive for the better way to fix
> things ;)

"Better" is such a subjective word.  Who defines what is better in their
particular instance?

> I'm not proposing to drop the workaround, but keeping the macro does
> break code as we are well aware. The above has no drawbacks that I can
> think of, and beats patching good code ;)

I agree that improving the legacy code which relies on index() is the
way to go, but there is a lot of it.  I don't have the time to patch
everything I come across.

At the moment the best solution for me and probably others is to fix the
one thing that doesn't work (qtopia) and move on, improving other things
as I get around to them.

A
