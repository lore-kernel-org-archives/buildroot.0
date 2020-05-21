From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 21 May 2020 08:27:36 +0200
Subject: [Buildroot] Console warning using the package aircrack-ng
In-Reply-To: <20200520190957.115bcdfb@gmx.net>
References: <CALtfCQYSupq9++U=Ua74Y3aT5Z7pxzHcEmERW-D-je3ZPGZG3w@mail.gmail.com>
 <20200520190957.115bcdfb@gmx.net>
Message-ID: <CALtfCQbha192QTuWxfQESzsfFAsJu=q7bKESB7roG53E4awssA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Perter,

> Run your command with:
>
>         LANG=en_US.utf8 /usr/sbin/airodump-ng wlan0mon ...
>
> in case en_US.utf8 is enabled in your buildroot config, otherwise rebuild with:
>
>         BR2_GENERATE_LOCALE="en_US"

Is there anyway to set this LANG variable automatically from
buildroot? I would like to avoid using LANG=en_US.utf8 everytime I
need to execute /usr/sbin/airodump-ng.


Oscar Gomez Fuente
