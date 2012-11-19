From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 19 Nov 2012 14:21:00 +0000
Subject: [Buildroot] [PATCH] x11r7: deprecate a number of unused old
 X.org video drivers
In-Reply-To: <20121119133038.4a1653b8@skate>
References: <1353192419-5405-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50AA2165.2090807@carallon.com> <20121119133038.4a1653b8@skate>
Message-ID: <50AA404C.1060800@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/2012 12:30, Thomas Petazzoni wrote:
> Will,
>
> On Mon, 19 Nov 2012 12:09:09 +0000, Will Wagner wrote:
>
>> Once a resolution is found to the mesa3d problem and committed I will
>> try again to get my x11r7.7 patches upstream that removes all old
>> modules from X.
>
> Aah, I didn't remember you had x11r7.7 ready somewhere. Can you point
> me to the Git tree again? As long as it removes or marks as
> deprecated the really useless X.org drivers, I'm fine with seeing your
> changes merged rather than mine.
>
> The mesa3d problem was fixed in master this week-end. It unfortunately
> introduced a regression when building host-libglib2 on a PowerPC host
> (seen on gcc110 build machine), but I think we'll try to address it
> separately.
>
> That said, your x11r7.7 bump is certainly -next material at this point,
> since -rc1 has been released.

Thomas,

You can find my work on updating to x11r7.7 on gitorious at 
https://gitorious.org/willw-buildroot/willw-buildroot/commits/remotes/gitorious/x11r7.7

It needs updating to buildroot head as it is now some way behind. I will 
look at that as soon as I have time so it can be considered for -next

Regards
Will

>
> Best regards,
>
> Thomas
>


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
