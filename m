From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Fri, 7 Feb 2020 14:22:56 +0100
Subject: [Buildroot] [PATCH 05/10] package/systemd: cosmetic rearrange
 list of users
In-Reply-To: <CADYdroNei=n_MK1iURBRqKBz5KFj=ghtkiYCstLNU=_TBPQoTA@mail.gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-6-nolange79@gmail.com>
 <CAFvCimWQmzczt5u0LuTW=vg4UUfXAZ3VAskCmU8CFYGPVgEcxw@mail.gmail.com>
 <CADYdroNxsdmgJHEaW1rHXN4KbyCkoD=yFzVuVPPeMV_xF0j4VA@mail.gmail.com>
 <CAFvCimUVLFW-K2WCU2nFLHkQutsW7HKjWeV5zWJ3cLqK3JurKQ@mail.gmail.com>
 <CADYdroNNEhAiEb10nO5h-Q5Sxp4MT0F6mMhR04tcpoKBza_7Jg@mail.gmail.com>
 <CAFvCimUei-cLjBYU5don-L9hJA5WgMS-NynOpsmTqsQ=bChmww@mail.gmail.com>
 <CADYdroNei=n_MK1iURBRqKBz5KFj=ghtkiYCstLNU=_TBPQoTA@mail.gmail.com>
Message-ID: <CAFvCimVUR=DZiJ2T5bv+YBdysZBFVBwTPVpPr9w3-2MTb41=fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le ven. 7 f?vr. 2020 ? 14:11, Norbert Lange <nolange79@gmail.com> a ?crit :

>
>
>
> what about changing mkuser default -1 to system user, adding a new value
> ('-2' or 'u') for normal user?
> That way you just need to patch the 1-2 spots where normal users are
> generated.
>
>
There are no such spot that I could find at first glance in buildroot
itself, but that would break user packages...
so I don't think that's a good idea. It would fix more (harmless) bugs than
it would create, but the bugs
created would be more problematic than the bugs fixed....

-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200207/72c85b6f/attachment.html>
