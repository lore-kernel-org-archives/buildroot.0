From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 19 Dec 2012 13:59:34 +0200
Subject: [Buildroot] elfutils successfully compiled with buildroot
	2012.05
In-Reply-To: <1355909574.8626.6.camel@sven>
References: <50D0E6D2.6040602@petroprogram.com> <1355909574.8626.6.camel@sven>
Message-ID: <50D1AC26.4010905@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good morning Sven

19.12.2012 11:32, Sven Neumann kirjoitti:
> On Tue, 2012-12-18 at 23:57 +0200, Stefan Fr?berg wrote:
>> Hello to all
>>
>> I just want to tell that I have now managed to complete building
>> elfutils version 0.155
>> successfully with Buildroot version 2012.05.
>>
>> After some sleep (and patch cleanup) I will send it here for initial review.
>> Not all of it went smoothly but I will explain it in more detail in the
>> patches.
>>
>> There are few screenshots of my uClibc environment under VirtualBox
>> with working readelf from elfutils package.
>>
>> Regards
>> Stefan
>>
>> P.S.:  AFAIK, Glib from version 2.32 and up needs elfutils (or at least
>> it's libelf component) as hard dependency ????
> No, it's a soft dependency. glib 2.32 will build without libelf. In a
> build without libelf you won't be able to use the GResource
> functionality though, see
> http://developer.gnome.org/gio/2.32/gio-GResource.html
>
>
> Regards,
> Sven
>
Ah, I see.

I assumed it to be hard dependency because in my Gentoo linux installation
they list it as so.
But this is good to know.

Thanks!

Regards
Stefan
