From: Chris LaRocque <clarocq@gmail.com>
Date: Mon, 25 Jan 2016 04:01:54 -0500
Subject: [Buildroot] ssh: connect to host pi adress port 22: Connection
	refused
In-Reply-To: <20160125093632.1539a594@free-electrons.com>
References: <CABi8WTyCkO0dbH0GKkwV+C4Hb_OtaPipk06zBuNCuDJoHK7bLA@mail.gmail.com>
 <loom.20160125T071123-991@post.gmane.org>
 <20160125093632.1539a594@free-electrons.com>
Message-ID: <CAOURK2u_zeJKQ4eC5hnzFt_oUQAzEn_+7tFwn9JnKPLZ_DSaQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas

On Jan 25, 2016 09:36, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Chris LaRocque,
>
> On Mon, 25 Jan 2016 06:16:13 +0000 (UTC), Chris LaRocque wrote:
>
> > I had a similar problem when starting with
> > my beaglebone black. Set the filesystem to
> > be mounted read/write. I suspect that
> > dropbear needs to write the ssh key to
> > file.
>
> It shouldn't be the case. In S50dropbear, we specifically handle the
> case of a read-only root filesystem, there's been some work done on
> this a few months ago.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

I'm certain that's the case but suggesting that the individual set
read/write is immediate feedback toward a solution and gets that individual
thinking about diagnosing the nature of the fault.

:-)

Regards

Chris

Pushing back the boundaries of ignorance.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160125/e15134d1/attachment.html>
