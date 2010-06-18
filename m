From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jun 2010 08:46:26 +0200
Subject: [Buildroot] [pull request] Pull request for branch linux-cleanup
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20100618084626.7b84de9f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jun 2010 20:50:04 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Here is a set of 10 patches that completely rewrites the Linux kernel
> compilation process in Buildroot. It is supposed to be applied on top
> of the bootloaders-cleanup branch I've sent yesterday.
> 
> I've fairly drastically reduced the number of options to configure the
> kernel, and particulary removed the horrible mess of version
> selection. See the first commit in this branch for what remains in
> terms of configuration options for the kernel. As I've removed quite a
> few things, I'm interested to know how you're using Buildroot to build
> your kernel, and whether this proposal still matches your use cases.
> 
> Peter: for me, this patch set is ready for inclusion, unless there are
> comments, of course.

I've done the following changes :

 * Rebased on top of master, now that the bootloaders-cleanup branch
   has been merged. As the linux-cleanup branch was initially based on
   bootloaders-cleanup, this rebase did not require any change in the
   code.

 * Added a new commit that deletes target/Config.in which is now longer
   used/needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
