From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 6 Jul 2020 13:20:14 +0200
Subject: [Buildroot] [PATCH=2020.02.x] package/redis: bump version to
 5.0.9
In-Reply-To: <87v9j1663m.fsf@dell.be.48ers.dk>
References: <20200621213921.11923-1-peter@korsgaard.com>
 <8cb0702e-2c5d-553b-5793-681ddc619130@railnova.eu>
 <CAAXf6LWhoLwig3i8FNjC3OQ65h27y50cbu5ROZkBHKnnXsjSUw@mail.gmail.com>
 <87zh8d666k.fsf@dell.be.48ers.dk> <87v9j1663m.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWadVCDZx7Zo5frTf8rfAtGpAm194FnengjW05zByO0Uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El dom., 5 jul. 2020 a las 22:48, Peter Korsgaard (<peter@korsgaard.com>)
escribi?:

> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
> Hi,
>
>  >> Just want to highlight that also the 5.0.8 turns out to have a security
>  >> fix: http://cve.circl.lu/cve/CVE-2020-14147
>
>  > True. Committed to 2020.02.x and 2020.05.x after adding the CVE info.
>
> Ehh, looking closer we already had 5.0.8, so I've just committed as is.
>

beeuh, I blame it on git :-D

It seems I had a branch '2020.02.x' which was not tracking
remotes/origin/2020.02.x thus eclipsing new changes and giving me basic
commands like 'git log 2020.02.x package/redis' incorrect results.

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200706/5f95c353/attachment.html>
