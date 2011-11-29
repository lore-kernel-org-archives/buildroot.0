From: =?utf-8?Q?Peter_Katzmann?= <peter.katzmann@edag.de>
Date: Tue, 29 Nov 2011 09:43:52 +0100
Subject: [Buildroot] [Bug ] 2011.11rc3 On 64bit Linux Dev Machine armeb
 builds libs to lib64 dir
Message-ID: <zarafa.4ed49b48.09c8.7a5242b651e89a8f@jedmail.edag.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,
i attach my config and the config.log of the jpeg lib which is one of the failing ones

peter

EDAG GmbH & Co.KG aA
Steinauer Stra?e 20 
36100 Petersberg
Tel.: +49 - (0)661 / 6000 - 9444
Fax: +49 - (0)661 / 6000 - 1116208
E-Mail: Peter.Katzmann at edag.de

-----Urspr?ngliche Nachricht-----
An:	Peter Katzmann <peter.katzmann@edag.de>; 
CC:	buildroot at busybox.net; 
Von:	Peter Korsgaard <jacmet@uclibc.org>
Gesendet:	Mo 28.11.2011 21:48
Betreff:	Re: [Bug ] 2011.11rc3 On 64bit Linux Dev Machine armeb builds libs to lib64 dir
> >>>>> "Peter" == Peter Katzmann <peter.katzmann@edag.de> writes:
> 
>  Peter> Hello,
>  Peter> i have a OpenSuse 12.1 64 Bit dev machine and building an armeb tree.
>  Peter> Now when tries to build mtd:
>  Peter> 
> /usr2/new/Source-ast18/build_env/buildroot/project_build_armeb/host/usr/lib64/gc
> c/armeb-unknown-linux-uclibcgnueabi/4.6.2/../../../../armeb-unknown-linux-uclibc
> gnueabi/bin/ld: cannot find -llzo2
>  Peter> collect2: ld returned 1 exit status
> 
> More details please. What is your .config exactly?
> 
> I just did a quick test build with the following configuration which
> built without problems:
> 
> BR2_armeb=y
> BR2_arm926t=y
> BR2_PACKAGE_MTD=y
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

-------------- next part --------------
A non-text attachment was scrubbed...
Name: toolchain_config-2011.11
Type: application/octet-stream
Size: 22197 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111129/36f368e1/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: text/x-log
Size: 78496 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111129/36f368e1/attachment-0001.bin>
