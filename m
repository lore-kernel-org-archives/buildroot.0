From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 04 Feb 2013 11:11:36 +0000
Subject: [Buildroot] X11 component versions
In-Reply-To: <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
Message-ID: <510F9768.4020907@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/2013 10:56, Nicolas Dechesne wrote:
> On Mon, Feb 4, 2013 at 11:45 AM, Will Wagner <will_wagner@carallon.com> wrote:
>> I have a set of patches for doing just that, just not had a chance to get
>> back to it and tidy them up for submission.
>>
>> It's still on my list of things to do, hopefully I'll find some time for it
>> soon.
>
> nice. if you have a 'not-yet-ready' branch somewhere, i can look at
> it, and test. I am primarily interesting in trying it on Pandaboard,
> and in that process I can package the xf86-video-omap X11 driver as
> well (which was what I wanted to do initially, until i realized that
> X11 in BR was too old ;-)
>

You can find my work on updating to x11r7.7 on gitorious at
https://gitorious.org/willw-buildroot/willw-buildroot/commits/remotes/gitorious/x11r7.7 


It is now based on a much older buildroot version and needs a lot of 
work to update.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
