From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 15 Jun 2010 11:54:53 +0200
Subject: [Buildroot] PATCH [1/1] fix  building QT with uclibc 0.9.31
In-Reply-To: <87hbl4eko5.fsf@macbook.be.48ers.dk>
Message-ID: <2C6417354DD842388DB55C32FB629195@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Peter

I think i started here
http://survey.avrfreaks.net/index.php?name=PNphpBB2&file=viewtopic&p=539852
and
https://dev.openwrt.org/browser/packages/Xorg/lib/qt4/patches/100-fix-webkit
-for-uclibc.patch
and
http://qt4-x11.sourcearchive.com/documentation/4.5.0~plus-prc1-0ubuntu1/Coll
ector_8cpp-source.html
Are also references to the problem/solutions

I'am not sure who wrote the original patch but i guess it might originate
from openwrt 


-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: dinsdag 15 juni 2010 10:59
Aan: Sagaert Johan
CC: 'Peter Korsgaard'; buildroot at busybox.net
Onderwerp: Re: PATCH [1/1] fix building QT with uclibc 0.9.31

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi Peter

 Sagaert> Did you build the JavaScriptCore and Multimedia module ?

Ahh, no - I didn't. I've tested it now and see the issue as well.

 Sagaert> I had a build error : pthread_getattr_np is not defined in uclibc,
Sagaert> there was a workaround for uclibc 0.9.30.x but not for 0.9.31.

Where does this patch come from? We try to add a description of what the
patches do and where they come from to the top of the files.

--
Bye, Peter Korsgaard
