From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 18 Dec 2015 08:56:21 -0200
Subject: [Buildroot] [PATCH v3] libgdiplus: new package
In-Reply-To: <20151218114117.5d273ce1@free-electrons.com>
References: <1448410510-23087-1-git-send-email-sergio.prado@e-labworks.com>
 <20151217222952.28cfb35c@free-electrons.com>
 <20151218114117.5d273ce1@free-electrons.com>
Message-ID: <CANu7NGtNLr0u42ZXMoOuuPMOp+Rm=c=GROEF=tZmgrWHQgfPqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2015-12-18 8:41 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Thu, 17 Dec 2015 22:29:52 +0100, Thomas Petazzoni wrote:
>
> > Other than that, I couldn't spot any issue, so I applied. Don't
> > hesitate to monitor http://autobuild.buildroot.org and/or the daily
> > autobuild report e-mails to see if there are any libgdiplus related
> > failures.
>
> There are some build issues:
>
>   http://autobuild.buildroot.org/?reason=libgdiplus-3.12
>
> There is a -L/lib somewhere which is wrong. Could you have a look?
>

Sure, I'll take a look.


>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151218/538d764f/attachment.html>
