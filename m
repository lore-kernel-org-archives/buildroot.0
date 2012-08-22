From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 22 Aug 2012 22:18:47 +0200
Subject: [Buildroot] [PATCH] barebox: fix license information
In-Reply-To: <20120822194924.268ac192@skate>
References: <1345639653-17544-1-git-send-email-spdawson@gmail.com>
 <20120822194924.268ac192@skate>
Message-ID: <50353EA7.6030901@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Le Wed, 22 Aug 2012 13:47:33 +0100,
> spdawson at gmail.com a ?crit :
>
>> From: Simon Dawson <spdawson@gmail.com>
>>
>> The barebox license is GPLv2, and not GPLv2+.
>>
>> Signed-off-by: Simon Dawson <spdawson@gmail.com>
>
> Thanks, applied.
>
> However, the Barebox license, just like U-Boot license, has a special
> exception to allow proprietary standalone applications to be linked
> against parts of Barebox/U-Boot without having to be released under the
> GPL. Should be use "GPLv2 with exceptions"? Or something else?

Ouch. Well, practically speaking, AFAIK we don't include standalone
Barebox applications in Buildroot, so this a NOOP in our case. If a user
includes such applications in their own copy of Busybox and build it with
Buildroot, then we may kind of assume that user will take care of handling
this case...

But from a formal and "legally-technical" POV, this license has some
exceptions to the original FSF text, so to be safe we should go that way.

I have no strong opinions at this time of the day, but I generally think
that when speaking legal, we should be as safe as possible.
So I'm moderately convinced this is a "GPLv2 with exceptions".

Other opinions are very welcome.

Luca
