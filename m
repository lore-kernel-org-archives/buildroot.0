From: Martin Bark <martin@barkynet.com>
Date: Tue, 14 Mar 2017 09:11:00 +0000
Subject: [Buildroot] [PATCH 2/3] package/nodejs: bump version to 7.7.1
In-Reply-To: <20170312233644.1006d0ef@free-electrons.com>
References: <1488671310-27378-1-git-send-email-martin@barkynet.com>
 <1488671310-27378-2-git-send-email-martin@barkynet.com>
 <20170312233644.1006d0ef@free-electrons.com>
Message-ID: <CAFGQKxdjvf2Vujy3e4BMn-ZZDOz_2cPJQvmkmFHcua-iUsa-Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 12 March 2017 at 22:36, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Sat,  4 Mar 2017 23:48:29 +0000, Martin Bark wrote:
> > See https://nodejs.org/en/blog/release/v7.7.1/
> >
> > Signed-off-by: Martin Bark <martin@barkynet.com>
>
> This patch breaks the build with nodejs 0.10, because nodejs 0.10 does
> not have this mkpeephole binary. Therefore, your PATCH 3/3 should be
> before PATCH 2/3.
>

Good point.  I'll fix that and resubmit.

Thanks

Martin


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170314/f0b131c6/attachment.html>
