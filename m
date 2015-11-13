From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 13 Nov 2015 06:24:22 +0100
Subject: [Buildroot] [PATCH 2/2] configs/qemu: bump to the latest linux
 version
In-Reply-To: <5645031D.5060405@zacarias.com.ar>
References: <1447151972-12086-1-git-send-email-gustavo@zacarias.com.ar>
 <1447151972-12086-2-git-send-email-gustavo@zacarias.com.ar>
 <20151112211421.GB21428@waldemar-brodkorb.de>
 <5645031D.5060405@zacarias.com.ar>
Message-ID: <20151113052422.GD21428@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,
Gustavo Zacarias wrote,

> On 12/11/15 18:14, Waldemar Brodkorb wrote:
> 
> >>x86: stick to 4.2.x kernels since 4.3 doesn't work right with uclibc
> >>(any variant) based toolchains.
> >
> >Can you elaborate on this?
> >A quick build test worked fine for me.
> >Or did you had any runtime issues?
> 
> Hi Waldemar.
> Just try to pull a dhcp address from the network interface.
> Regards.

Fixed here:
http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=1.0&id=e89e3af8f64bded3920f046fb8db2b95a188ff55

Best regards
 Waldemar 
