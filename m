From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Jun 2015 19:14:47 -0300
Subject: [Buildroot] [PATCH] configs/acmesystems_aria_g25: new config
In-Reply-To: <20150630000851.66e6e502@free-electrons.com>
References: <1435595496-8627-1-git-send-email-gustavo@zacarias.com.ar>	<20150629221332.30296de3@free-electrons.com>	<5591BA72.2040903@zacarias.com.ar>
 <20150630000851.66e6e502@free-electrons.com>
Message-ID: <5591C357.2000008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/06/15 19:08, Thomas Petazzoni wrote:

> One thing that was bothering me in the contribution from Angelo was
> specifically the need for two defconfigs. I guess there's no way to
> runtime detect the memory size, and therefore build a single
> at91bootstrap3 for both board configurations?

It doesn't seem to be the case at this point.
I think it could be doable via 2nd stage (u-boot) but for an SD-boot i 
don't see much benefit in having it around (that would change if eMMC 
was involved, but it generally isn't the case, specially for the Arietta).

> I really only asked for patch review, not testing. So not having the HW
> is not a good excuse :-)

Yes, yes, i know, i was just stating that it'll be a quick look with 
Aria-knowledge :)
Regards.
