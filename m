From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jan 2014 08:14:16 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
In-Reply-To: <skn6raxead.ln2@ID-313208.user.individual.net>
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.1998@free.fr>
 <el80raxhff.ln2@ID-313208.user.individual.net>
 <20140120212701.GC3421@free.fr> <20140122223320.GD3592@free.fr>
 <8738kfd40w.fsf@dell.be.48ers.dk>
 <skn6raxead.ln2@ID-313208.user.individual.net>
Message-ID: <c2393d0e-966f-4ce0-8aaf-495c87e53a6f@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

>Peter Korsgaard <jacmet@uclibc.org> wrote in
news:8738kfd40w.fsf at dell.be.48ers.dk: 

>> If not, I would simply say that ffmpeg 2.x is the latest and greatest of
>> ffmpeg, so ffmpeg.mk should build 2.x (and we shouldn't have a
>> ffmpeg2.mk)
>atm xbmc gotham is incompatible with ffmpeg 2.x, therefore I sent ffmpeg 
>1.2.5 for inclusion in buildroot.
>
>@Yann: Does omxplayer also work with ffmpeg 1.2.5?

Not as I know.

Their standard build ptocedure even git-clones ffmpeg2 explicitly.

Regarda,

Yann E. MORIN.

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
