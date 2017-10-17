From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 20:54:37 +0200
Subject: [Buildroot] [PATCH] uboot-tools: bugfix libfdt python build
In-Reply-To: <CANQCQpZFwWLqMZ1Y6mCWQieVFgka+uZs_vJeS6+BPOLUhyPF0A@mail.gmail.com>
References: <20171013023556.25825-1-matthew.weber@rockwellcollins.com>
 <20171013161128.37827061@windsurf.lan>
 <CANQCQpZhRskjjpSbOiUEEM0qEimpkC+R7NA1B1iV-G+HO1+=iQ@mail.gmail.com>
 <CANQCQpbf+LPbfEnw91CkD7H5kxRSywZGbPD9vcU074e3sA2puA@mail.gmail.com>
 <CAOMZO5BT1YLM2p3GVe7W4SwDYW18fGXCiMKd3D59hYJf9hE7wQ@mail.gmail.com>
 <CANQCQpZFwWLqMZ1Y6mCWQieVFgka+uZs_vJeS6+BPOLUhyPF0A@mail.gmail.com>
Message-ID: <20171017205437.4689e5f0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 13:16:01 -0500, Matthew Weber wrote:

> Looking at the current development on uboot upstream, the 2017.11
> release will be the bump we should take.  With that they cleaned up
> the tools having some default python/swig dependencies by having
> libfdt enabled in uboot kconfig.  We'll still have to update the
> BR2_TARGET_UBOOT_NEEDS_PYLIBFDT option in the uboot package so that it
> includes providing the PYTHON path variable to the build.  The
> upstream changes also removed the need for this patchset against
> uboot-tools fixing python and swig patch issues.

Thanks for looking into this!

> I'll send a proposed patchset for a 2017.11 bump later this month
> after testing with a -rc

Do we have a workaround in the mean time, to avoid trashing the
autobuilder results?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
