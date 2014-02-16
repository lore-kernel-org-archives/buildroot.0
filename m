From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 16 Feb 2014 21:52:28 +0100
Subject: [Buildroot] [PATCH v6 4/4] xbmc: new package
In-Reply-To: <5301234F.8050309@trzebnica.net>
References: <1392557273-3522-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392557273-3522-5-git-send-email-maxime.hadjinlian@gmail.com>
 <5301234F.8050309@trzebnica.net>
Message-ID: <CAGduivwT9OkAxvXFydr7QoqsG1OBQ8=-fxk6tQxbRpnKeo-a4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy, all
On Sun, Feb 16, 2014 at 9:45 PM, Jerzy Grzegorek
<jerzy.grzegorek@trzebnica.net> wrote:
>
> Hi Maxime,
>
>
>> +       select BR2_PACKAGE_SQLITE
>> +       select BR2_PACKAGE_TAGLIB
>> +       select BR2_PACKAGE_TIFF
>> +       select BR2_PACKAGE_TIFF
>
>
> Why two times?
>
> Regards,
> Jerzy
>
>
Because of a copy-paste mistake :).
Thanks for pointing that out.
