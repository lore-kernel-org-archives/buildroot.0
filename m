From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 24 Sep 2007 10:13:39 +0200
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <1190606113.22869.5.camel@cyclops.infocab.com.au>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
	<d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
	<1190600185.4299.44.camel@cyclops.infocab.com.au>
	<d6cda7730709232043k2d85bb2bi8318ef6f652a1eff@mail.gmail.com>
	<1190606113.22869.5.camel@cyclops.infocab.com.au>
Message-ID: <20070924081339.GA31515@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 24, 2007 at 01:25:13PM +0930, Adam Hawes wrote:
>
>>    You are fixing newer, valid and good code in the name of legacy
>> compatibility with a flawed work around for legacy API. The simple
>> fact that there are more than one way around it doesn't make the patch
>> the better way. And I think we should strive for the better way to fix
>> things ;)
>
>"Better" is such a subjective word.  Who defines what is better in their
>particular instance?

The current impl in uClibc is fine. You're broken if you rely on those
legacy stuff anyway, just turn it off to safe you some headache.
