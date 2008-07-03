From: Arnar Mar Sig <antab@valka.is>
Date: Thu, 3 Jul 2008 21:49:09 +0000
Subject: [Buildroot] MySQL
In-Reply-To: <C780E22E-5C85-49A6-8B60-AC9E67CB236A@nebkom.co.za>
References: <C780E22E-5C85-49A6-8B60-AC9E67CB236A@nebkom.co.za>
Message-ID: <A9F85048-8734-442B-B48B-5B79C92A1081@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mysql client builds and runs on avr32. I haven't tried building the  
server itself but it should work without much work, but i recommend  
using sqlite instead of mysql if you need the server part running on  
your board also.


On Jul 3, 2008, at 8:24 PM, Douglas Lane wrote:

> Hi everyone.
>
> I've done a search on the buildroot mailing list, but found nothing on
> MySQL?
>
> Can it be done? Or do I need to convert to SQLite?
>
> Thanks
> Doug
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Greets
	Arnar Mar Sig
	Valka ehf
