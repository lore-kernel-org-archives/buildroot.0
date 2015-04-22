From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Apr 2015 23:29:53 +0200
Subject: [Buildroot] [PATCH 04/19] package/hiawatha: bump version to 9.12
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
 <1429453778-4178-4-git-send-email-bernd.kuhls@t-online.de>
 <5533BD76.5070903@zacarias.com.ar>
Message-ID: <XnsA484EF08AA918berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote in 
news:5533BD76.5070903 at zacarias.com.ar:

>> -HIAWATHA_VERSION = 9.2
>> +HIAWATHA_VERSION = 9.12
> 
> Did you try this with polarssl on?
> Last time i tried it wanted 1.3.x which has a different API than 1.2.x
> (so bumping it would break other packages).
> And they don't seem to be able to live side by side either.

Hi,

argh, I missed that, sorry. No, I did not test with polarssl, therefore I 
marked my patch as "Changes Requested" in patchworks. This bump was a "drive-
by bump" during my hash series last weekend.

Regards, Bernd
