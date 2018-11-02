From: Nuno Mota <nrmmota@gmail.com>
Date: Fri, 2 Nov 2018 12:27:01 +0000
Subject: [Buildroot] ELFCLASS issue on building Perl module Term::ReadKey
In-Reply-To: <CAB0FRsuDcAujD=yBC3kLPnF8voFputTyh2T9aZk97eXcYHzYkA@mail.gmail.com>
References: <CAAnJVhCshyo-nHCVo303qLJiXJd8c7xh91-mDHgFsDn4VyYoVw@mail.gmail.com>
 <20181101120422.381449c6@windsurf>
 <CAB0FRsuDcAujD=yBC3kLPnF8voFputTyh2T9aZk97eXcYHzYkA@mail.gmail.com>
Message-ID: <CAAnJVhB-JrAu9P=zXK5q9Wg28XC9LgyZ5+V384FtA6_C=Rx41g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I see this is tricky.
What would be the best way to tackle this?

Regards,
Nuno

Fran?ois Perrad <francois.perrad@gadz.org> escreveu no dia quinta,
1/11/2018 ?(s) 17:36:

>
>
> Le jeu. 1 nov. 2018 ? 12:04, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> a ?crit :
>
>> Hello Nuno,
>>
>> I'm adding Fran?ois and Christopher in Cc, since they are the two
>> developers using/working on Perl support in Buildroot.
>>
>>
> Christopher works on this package, see
> https://patchwork.ozlabs.org/patch/959629/
> https://patchwork.ozlabs.org/patch/956600/
>
> This package is not cross-compilation friendly.
>
> Fran?ois
>
>
>>
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181102/45f22d13/attachment.html>
