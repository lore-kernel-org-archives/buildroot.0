From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 11 Aug 2007 23:46:14 +0300
Subject: [Buildroot] *FLAWED* Re:  PATCH: correct expat DESTDIR ,
 was ( expat is not correctly installed)
In-Reply-To: <0708111950160.10468@somehost>
References: <46BB94BC.5070904@promwad.com>
	<46BDC2BA.4020001@promwad.com>	<1186854238.4742.1.camel@elrond.sweden.atmel.com>	<46BDFAEB.3070401@promwad.com>
	<0708111950160.10468@somehost>
Message-ID: <46BE2016.40408@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cristian Ionescu-Idbohrn ?????:
> On Sat, 11 Aug 2007, Ivan Kuten wrote:
> 
>> Ulf Samuelsson : l?r 2007-08-11 klockan 17:07 +0300 skrev Ivan Kuten:
>>> Your patches fail miserably, since your email client replaces tabs
>>> with spaces. This means that patches have to be applied manually :-(
>> Hm, strange, i'm using thunderbird-2.0 with plain text messaging.
> 
> Not strange at all.  Here is the problem:
> 
>   User-Agent: Thunderbird 2.0.0.6 (X11/20070728)
>   Content-Type: text/plain; charset=UTF-8; format=flowed
>                             ^^^^^^^^^^^^^  ^^^^^^^^^^^^^
> 
> Biggest problem is 'format=flowed'; that screws up _all_ inlined text.
> This is a PITA with most mailers :(
> You should really consider reconfiguring that:
> 
> ,----[ user.js ]
> | pref("mailnews.send_plaintext_flowed", false); // RFC 2646
> | pref("mailnews.display.disable_format_flowed_support", true);
> `----
> 
> so you avoid both sending and receiving flawed^H^H^H^Howed email.
> utf-8 is also known to cause paines.
> 
> 
> Cheers,
> 

Cristian,

Thanks for hints, hope my next patch will be applied cleanly :-)

BR,
Ivan
