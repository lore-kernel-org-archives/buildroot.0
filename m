From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 May 2017 13:03:35 +0200
Subject: [Buildroot] [PATCH/next 1/1] lxc: fix hash of patch
In-Reply-To: <20170529121236.5318e2d8@free-electrons.com>
References: <1496044092-78363-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170529121236.5318e2d8@free-electrons.com>
Message-ID: <CAPi7W83jQ9Z2t9TDLc5ZRo1tmPHF4SkYD86aBAKkOD0=99zwnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2017-05-29 12:12 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Mon, 29 May 2017 09:48:12 +0200, Fabrice Fontaine wrote:
> > Fix hash of bc5b27d6f6d166d2a6df47982cbe36041ce6b73.patch
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Why did the hash changed?
>
I don't know, Bernd sent me an email about it so I fixed it. I don't think
I made a mistake in my first patch because I had to delete my local patch
file in dl repository to reproduce the issue. Can the hash on a github
commit change? Should I download 7e0ed7ffa0438a3d0e200a881f2166dc3632dcda
(merge commit) instead of bc5b27d6f6d166d2a6df47982cbe36041ce6b73?

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170529/0803049b/attachment.html>
