From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 1 Nov 2008 15:42:26 -0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <061E11D86E3DFF459604DF5B36F0805F1BA6D3@salka01.valka.local>
References: <20081031171723.6F149F8055@busybox.net>
	<200811011247.26080.markus.heidelberg@web.de>
	<061E11D86E3DFF459604DF5B36F0805F1BA6D3@salka01.valka.local>
Message-ID: <d6cda7730811011042r53b2aeecgd5f1ced3a24895b1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> I don't know what the multiscreen driver is about, sounds like multiple
>> physical screens. Is this a common setup that you default to y here?
>
> Multiscreen is for using more then one output driver yes, so you can use
> linuxfb and VNC at the same time (what i'm doing). Probably should have it
> default no.

Hi Arnar,

    Just out of curiosity, did you try the new directfb driver? It's
new to 4.4 series I think. Since directfb was supposed to have the
AVR32 accelarated instructions, so you would effectively have an
accelarated gfx driver.

    I've been meaning to test it out myself but my hardware with LCD
isn't ready yet :(

Kind Regards,
    Thiago A. Correa
