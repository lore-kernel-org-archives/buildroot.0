From: John Voltz <john.voltz@gmail.com>
Date: Thu, 6 Mar 2008 14:45:34 -0500
Subject: [Buildroot] (no subject)
Message-ID: <46a136670803061145v2453608bh255005be6ee0e479@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 >> +             --with-alsa-devdir=/dev \

>Why? Better approach to make a proper mdev.conf script which puts alsa
>devices into the correct place.

>> +             --with-softfloat \

>Architecture dependant?

I didn't know about doing it with mdev. Recently I had been having trouble
getting mdev to even work with busybox 1.9.x.

I'll fix that arch dependent line pronto.

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080306/2a05a359/attachment.htm 
