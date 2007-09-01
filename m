From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 1 Sep 2007 18:31:15 +0200
Subject: [Buildroot] mplayer-package doesn't build	forotherarchitectures
	than avr32
In-Reply-To: <00cb01c7ec06$cf9c3bb0$c6dc780a@atmel.com>
References: <f90898420708290133i7ac1f31dkbdd53649945091b3@mail.gmail.com>
	<20070830221454.GG11697@aon.at>
	<014601c7eb5a$138e37e0$36f2780a@atmel.com>
	<20070831073156.GA29704@aon.at>
	<00cb01c7ec06$cf9c3bb0$c6dc780a@atmel.com>
Message-ID: <20070901163115.GM11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 31, 2007 at 06:05:07PM +0200, Ulf Samuelsson wrote:

>> Given that mplayer currently is at 1.0-rc1 (i.e. not released), what
>> about fixing this in the proper place, i.e. upstream?
>> $ svn ls svn://svn.mplayerhq.hu/ffmpeg/trunk/libavcodec/ | grep -i avr
>> $
>> Turns up nothing..
>>
>
>I think it is the intention of the AVR32 team to ensure that all additions

yep.

>they do are fed upstream, but I do not control their activities.

Of course not. But now would be a good time to make sure that your avr
patches are applied for the 1.0 release, fwiw..
