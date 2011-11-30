From: =?utf-8?Q?Peter_Katzmann?= <peter.katzmann@edag.de>
Date: Wed, 30 Nov 2011 08:33:01 +0100
Subject: [Buildroot] [Bug ] 2011.11rc3 On 64bit Linux Dev Machine armeb
 builds libs to lib64 dir
Message-ID: <zarafa.4ed5dc2d.603a.2deccef7625bf8b7@jedmail.edag.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,
in my case it was atomic_ops, jpeg and lzo.
Afters this the build process failed, so probably more libs are affected.

peter


-----Urspr?ngliche Nachricht-----
An:	Peter Katzmann <peter.katzmann@edag.de>; 
CC:	Trevor Woerner <twoerner@gmail.com>; buildroot at busybox.net; 
Von:	Peter Korsgaard <jacmet@uclibc.org>
Gesendet:	Di 29.11.2011 20:45
Betreff:	Re: [Bug ] 2011.11rc3 On 64bit Linux Dev Machine armeb builds libs to lib64 dir
> >>>>> "Peter" == Peter Katzmann <peter.katzmann@edag.de> writes:
> 
>  Peter> Hello,
>  Peter> it seems that some configure scripts needs a little help to know where 
> to place the library's.
>  Peter> The following small patch fixes the problem for me, but i don't know if 
> it is a good idea for all platforms to insist that the libdir is /usr/lib .
>  Peter> peter
> 
> What packages were those exactly?
> 
> -- 
> Bye, Peter Korsgaard
> 
>
?Die n?chsten Messeauftritte der EDAG Group:
Business of Design Week in Hongkong vom 01.-03.12.2011 in der Inspiration Hall, Stand 3D-C09
Auto Expo in Neu Delhi vom 05.-11.01.2012
Internationaler Automobilsalon in Genf vom 06.-18.03.2012 in Halle 2, Stand 2158

The EDAG Group's next exhibitions: 
Business of Design Week in Hongkong, 1 to 3 December 2011 at Inspiration Hall, Stand 3D-C09
Auto Expo in Neu Delhi, 5 to 11 January 2012
International Motor Show in Geneva, 6 to 18 March 2012 at Stand 2158, Hall 2

Mehr News und Informationen aus der Welt der EDAG Group k?nnen Sie in unserem interaktiven EMAG-Magazin (http://www.edag.de/pr/Newsletter/) nachlesen! Wir freuen uns auf Ihren Besuch!

------------------------------------------------------------------------------
Court of jurisdiction: Amtsgericht Fulda, HRB 1075     USt.-Id: DE 112 402 594
Gesch?ftsf?hrung / Executive Board: J?rg Ohlsen: Gesch?ftsf?hrer / CEO, Manfred Hahl: Gesch?ftsf?hrer / COO, Rainer Bauer: Gesch?ftsf?hrer / CFO
Aufsichtsratsvorsitzender / Chairman of the Supervisory Board: Dr. Lutz Helmig
Pers?nlich haftende Gesellschafterin / General partner: EDAG Gesellschaft mbH, Wien, Handelsgericht Wien, FN 297836 W
Headquarters: EDAG GmbH & Co. KGaA, Reesbergstra?e 1, 36039 Fulda, Germany  /  www.edag.com

This e-mail may contain confidential and/or privileged information. If you are not the intended recipient (or have received this e-mail in error) please notify the sender immediately and destroy this e-mail. Any unauthorised copying, disclosure or distribution of the material in this e-mail is strictly forbidden.
