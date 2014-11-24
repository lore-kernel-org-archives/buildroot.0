From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Nov 2014 18:09:58 -0300
Subject: [Buildroot] [PATCH 2/2] samba: Add support for libnss_win*.so*
 installation
In-Reply-To: <CA+sos7_JzpU07bYQRvNN8wU1p5nuiQXyR2dTUqEwGE63aJJJ=Q@mail.gmail.com>
References: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407176057-13180-2-git-send-email-benoit.thebaudeau@advansee.com>
 <20141122213359.2628a10e@free-electrons.com>
 <54730753.3030108@zacarias.com.ar>
 <20141124203453.59c5f279@free-electrons.com>
 <CA+sos7_JzpU07bYQRvNN8wU1p5nuiQXyR2dTUqEwGE63aJJJ=Q@mail.gmail.com>
Message-ID: <54739EA6.6060000@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/24/2014 06:05 PM, Beno?t Th?baudeau wrote:

>>> Also please note that Samba 3 is very likely going EOL as soon as Samba
>>> 4.2.x is released which even though delayed a bit in the RC phase is
>>> coming along pretty soon, so adding feature to the samba3 package isn't
>>> very wise IMHO (it's in security-only fixes now).
>>> See: https://wiki.samba.org/index.php/Samba_Release_Planning
>>
>> Ok. Still there's some chance that we will keep Samba 3 around for a
>> bit of time, just like we still have libgtk2 available.
> 
> That would be great. samba4 is currently monolithic and huge for
> embedded targets.

I agree it'd be great since samba4 is huge in comparison (mostly because
of the added dependencies, otherwise it's more logically put together in
the target in the form of more shared libraries with common code instead
of the "really big" binaries samba 3.x has).
But i'm afraid upstream will throw the glove off on the 3.x series,
there's been talk about it in the mailing list and it's on
security-fixes only mode at the moment.
Regards.
