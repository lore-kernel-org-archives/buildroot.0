From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 1 Oct 2019 00:38:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] cmake: bump version to 3.15.3
In-Reply-To: <20190930233542.6a084b17@windsurf.home>
References: <20190929115731.128904-1-james.hilliard1@gmail.com>
 <20190930233542.6a084b17@windsurf.home>
Message-ID: <CADvTj4qO6FZYmjgP2GBLcrf7P-k14JCz2jVvcTrFT4B1Tt5dbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 30, 2019, 11:35 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello James,
>
> On Sun, 29 Sep 2019 05:57:31 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Remove FindLibUV patch which is now upstream.
> >
> > Resync/reformat rename cmake rootfile patch for 3.15.3 with git
> format-patch.
> >
> > Set cmake version min to 3.10.
>
> What is the reasoning for changing the minimal CMake version to 3.10 ?
>
It's the minimum required by wpewebkit.

> This minimum version is the minimum version required by all
> cmake-package packages in Buildroot, and is important when the
> system-provided cmake is used as opposed to using Buildroot's
> host-cmake. So I don't see how it can be related to a version bump of
> CMake.
>
> The second question is how many cmake-package packages you have tested
> with this patch applied ? We don't need all of them to be tested, but
> it would be good to test a fair amount of them, and provide in the
> commit log the defconfig that was used to test all those packages.
>
Not entirely sure but was probably a decent amount as part of my normal
firmware builds.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191001/f4287874/attachment.html>
