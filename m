From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 09 Apr 2015 16:45:03 -0300
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.3.1
In-Reply-To: <20150409214407.5592a172@free-electrons.com>
References: <1428605866-17345-1-git-send-email-gustavo@zacarias.com.ar>
 <20150409214407.5592a172@free-electrons.com>
Message-ID: <5526D6BF.7020506@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/09/2015 04:44 PM, Thomas Petazzoni wrote:
> It's a little bit strange to have the unconditional PCIUTILS_MAKE_OPTS
> after the conditional ones.
> 
> But it's also tied to the fact that for udev you've decided to add
> HWDB=<foo> in PCIUTILS_MAKE_OPTS, while for the other dependencies,
> they do PCIUTILS_ZLIB = <foo>, and then in PCIUTILS_MAKE_OPTS, they
> have ZLIB=$(PCIUTILS_ZLIB).
> 
> So things are not very consistent right now. If you can send a
> follow-up patch to make things a bit more consistent, it'd be great.

Yes, i'll send a cleanup.
Regards.
