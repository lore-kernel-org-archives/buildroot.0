From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 3 Oct 2017 16:13:00 +0300
Subject: [Buildroot] [PATCH] vboot-utils: disable static futility
In-Reply-To: <CANQCQpb76ZKCxDbaT+sbSQF3fO99DRQaJp1Ty0xYi+nX+GU+Qg@mail.gmail.com>
References: <20171003083737.GA3986@latitude.localdomain>
 <CANQCQpb76ZKCxDbaT+sbSQF3fO99DRQaJp1Ty0xYi+nX+GU+Qg@mail.gmail.com>
Message-ID: <20171003131300.GA20634@latitude.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tue, Oct 03, 2017 at 07:45:48AM -0500, Matthew Weber wrote:

> I'll take a look and see if it works.  The patch looks like it
> completely disables building of static bins for target and host.  Is
> that intended?

There's a single static binary, and it's a host-only package.
So yeah the patch just cuts it out and it's intentional.

I'm not even sure why they needed a static version of this particular
tool, but it doesn't look like there's any better way to disable it.
