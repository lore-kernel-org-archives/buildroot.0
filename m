From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 15:24:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-03
In-Reply-To: <CANQCQpZXApJkf7WPJjzVEXSyodyWZF5DJ2_OzfiYpe-jG6ruxg@mail.gmail.com>
References: <20170504062805.21F8320C54@mail.free-electrons.com>
 <CANQCQpZXApJkf7WPJjzVEXSyodyWZF5DJ2_OzfiYpe-jG6ruxg@mail.gmail.com>
Message-ID: <20170504152451.14c7153d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 May 2017 08:10:05 -0500, Matthew Weber wrote:

> >            uboot-tools-2017.03 | 6  
> 
> Worked around with this patchset
> https://patchwork.ozlabs.org/patch/757382/

Seen it, but I'm not sure this solution will be accepted upstream. That
being said, it's quite simple and straightforward, so maybe we should
take it, until upstream does something to resolve the issue.

> >                     mpir-3.0.0 | 5
> >                acpica-20170303 | 4
> >                  libqmi-1.18.0 | 4  
> 
> Resolved by this patchset
> https://patchwork.ozlabs.org/patch/757363/

ACK.

Thanks for following up on those issues, very useful!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
