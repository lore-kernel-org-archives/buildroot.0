From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 20 Aug 2015 12:31:15 +0100
Subject: [Buildroot] Analysis of build results for 2015-08-18
In-Reply-To: <87k2sq7aal.fsf@dell.be.48ers.dk>
References: <20150819063013.E74B810154B@stock.ovh.net>
 <20150819224105.2993bbe5@free-electrons.com>
 <CA+BsyQ7iPgOxOOY+vi09shjAJMhkaFQBcfe6EEJxmX_kVPh21A@mail.gmail.com>
 <87k2sq7aal.fsf@dell.be.48ers.dk>
Message-ID: <CA+BsyQ4AxQyav9w6euXvrRXNUFMhTkeCXNN0gLz4r92pfsGDOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[libpam]

>  > I will try to send an RFC patch tomorrow, it might take an iteration
>  > or two to get it right. This might be a case where it is appropriate
>  > to disable libpam + musl in the coming release.
>
> For 2015.08 I would prefer to just disable it for musl. In general, we
> want to carry as few / small patches as possible - So if we can work
> with upstream to get these included that would be very good.

Okay, will I send a patch to disable with musl for the short term ?

In the longer term - this could get complicated. There are 9 patches
in buildroot already against linux-pam and none have the
upstream-status marked :(. Also, we are two releases (= two years)
behind the upstream. I think I'll need to review all of the buildroot
patches to see if they've made it up there, and look at doing a
version bump to the latest.

Brendan
