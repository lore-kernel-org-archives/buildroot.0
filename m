From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 May 2020 20:28:09 +0200
Subject: [Buildroot] [PATCH/next/RFC 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.0-rc2
References: <20200511053855.120869-1-bernd.kuhls@t-online.de>
 <e6a9e2bb-9203-2792-4f16-9338c2cc637e@gmail.com>
Message-ID: <pun5pgx1cl.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 16 May 2020 14:49:34 +0200 schrieb Romain Naour:

> Hi Bernd,
> 
> Le 11/05/2020 ? 07:38, Bernd Kuhls a ?crit?:
>> Gallium drivers lima and panfrost
>> https://cgit.freedesktop.org/mesa/mesa/tree/src/meson.build?h=20.1#n83
>> 
>> both use shared panfrost code which now needs fromfp functions only
>> present in glibc:
>> https://mailman.uclibc-ng.org/pipermail/devel/2020-May/001968.html
> 
> Maybe it would be good to report on the mesa mailing list too.

Hi Romain,

not necessary anymore, rc3 removed the restriction with this commit:
https://cgit.freedesktop.org/mesa/mesa/commit/?
h=20.1&id=096e06c56aaed4fb43ba5c35694e815d5740e29d

and we do not build mesa3d tools ;)

Regards, Bernd
