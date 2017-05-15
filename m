From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 May 2017 21:16:37 +0200
Subject: [Buildroot] IASL Support in BuildRoot?
In-Reply-To: <CAKmqyKOOgf2kKSAag=uLUzQX+Qkjom9ZyXQPHhdCuBG3t7XxuA@mail.gmail.com>
References: <CAKmqyKOOgf2kKSAag=uLUzQX+Qkjom9ZyXQPHhdCuBG3t7XxuA@mail.gmail.com>
Message-ID: <20170515211637.1b982225@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 May 2017 10:24:47 -0700, Alistair Francis wrote:
> + BuildRoot mailing list
> Change the subject, was: [autobuild.buildroot.net] Your build results
> for 2017-05-01
> 
> This is failing because the host doesn't have iasl (from the
> acpi-tools package).
> 
> I looked at BuildRoot and it supports building this for the target,
> but no host support. What is the usual process here? Do we add it as a
> host requirement or do we add support to build it?

Adding support to build it is our normal way of solving this type of
dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
