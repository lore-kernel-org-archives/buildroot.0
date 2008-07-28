From: Jonathan and Caroline Moore <jandcmoore@gmail.com>
Date: Mon, 28 Jul 2008 12:13:36 +0100
Subject: [Buildroot] Bash failing
In-Reply-To: <488D8691.6070904@cetrtapot.si>
References: <8bf7d05b0807260046q35afd439kf3d0a8b950dc5344@mail.gmail.com>
	<488D8691.6070904@cetrtapot.si>
Message-ID: <8bf7d05b0807280413t58506a27jcfcf36ae301de559@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK I guess I need some more help.

I thought buildroot took care of these details or am I meant to do
something before typing make?

Would it help if I attached some of the files?



Jonathan

2008/7/28 Hinko Kocevar <hinko.kocevar@cetrtapot.si>:
> Jonathan and Caroline Moore wrote:
>> Anyone able to help me out with these bash complaints please.
>>
>> Jonathan (buildroot 20080725)
>>
>> In file included from display.c:49:
>> tcap.h:35:23: error: termcap.h: No such file or directory
>
> This would suggest that termcap lib was a) not built prior to bash or b) the termcap.h is not present in staging folders.
>
> HTH,
> Hinko
>
> --
> ?ETRTA POT, d.o.o., Kranj
> Planina 3
> 4000 Kranj
> Slovenia, Europe
> Tel. +386 (0) 4 280 66 03
> E-mail: hinko.kocevar at cetrtapot.si
> Http: www.cetrtapot.si
>
>



-- 
Jonathan (and Caroline)

Jonathan and Caroline Moore
JandCMoore at gmail.com (Jonathan)
CandJMoore at gmail.com (Caroline)
http://jandcmoore.googlepages.com/
