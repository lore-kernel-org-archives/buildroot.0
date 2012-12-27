From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 27 Dec 2012 20:24:29 +0200
Subject: [Buildroot] [PATCH] new package: libpciaccess
In-Reply-To: <20121223162012.24cfdd64@skate>
References: <1356220309-22847-1-git-send-email-stefan.froberg@petroprogram.com>
 <87y5gpt9h0.fsf@dell.be.48ers.dk> <50D6F90F.7020104@petroprogram.com>
 <87txrcuaz8.fsf@dell.be.48ers.dk> <50D70F60.50503@petroprogram.com>
 <20121223162012.24cfdd64@skate>
Message-ID: <50DC925D.4050805@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

23.12.2012 17:20, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sun, 23 Dec 2012 16:04:16 +0200, Stefan Fr?berg wrote:
>
>> That mesa3d updating beyond 7.10.3 (that I have here) seems especially
>> interesting challenge.
> Do you have more details about the issues involved in bumping mesa3d
> beyond 7.10.3 ?
>
> Thomas
Well, if you try to bump it to 8.0.5 version, it will abort at some point.

It borks at the time it tries to compile glsl.

It tries to build helper program (builtin_compiler) with system python
(shouldn't that be HOST_DIR/usr/bin/python ???)
and then it crashes.

I have included here the actual screenshot of the situation.

Regards
Stefan

-------------- next part --------------
A non-text attachment was scrubbed...
Name: mesa3d.png
Type: image/png
Size: 39368 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121227/91288579/attachment-0001.png>
