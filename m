From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 09:36:11 +0100
Subject: [Buildroot] Beginner documentation
In-Reply-To: <3B941116898CDA489B91563DEF88F4B61CAD8E@iwt-server.iwt.local>
References: <3B941116898CDA489B91563DEF88F4B61CAD8E@iwt-server.iwt.local>
Message-ID: <20100223093611.0f5ef6fe@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

On Tue, 23 Feb 2010 14:17:40 +1100
"Paul Jones" <Paul.Jones@iwtech.com.au> wrote:

> I'm trying to build a basic buildroot i686 system that I can use for
> learning buildroot. When doing "make linux26-menuconfig" it failed
> because it couldn't find the .config file. From past experience I
> remembered that I have to do make defconfig before that would work, but
> there seems to be no mention of this in the documentation. It would be
> good if something could be added.

I'm not personaly not an user of Buildroot's ability to build the
kernel. Therefore, I'll let others comment on this point.

> I assume http://buildroot.uclibc.org/buildroot.html is the right page to
> be looking at?

Yes, it is the right page to look at. However, documentation is like
software, it might have bugs. Since I'm the author of a large portion
of this documentation and I don't know the kernel build part of
Buildroot, it's very possible that the information in the documentation
isn't exactly correct, or that things have evolved since the
documentation has been written.

If you find any mistakes or inconsistencies, do not hesitate to report
them.

Sincerely,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
