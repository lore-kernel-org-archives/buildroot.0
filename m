From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 4 Oct 2014 08:16:41 -0500
Subject: [Buildroot] [PATCH v2] protobuf: bump version to 2.6.0
In-Reply-To: <20141004142755.1f402a23@free-electrons.com>
References: <1412282436-9176-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20141004142755.1f402a23@free-electrons.com>
Message-ID: <CANQCQpYw8zpyFpidYE1_kMdWPumy7qF7JmpwqNEM1qvOeg1g_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
On Oct 4, 2014 7:28 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Matt Weber,
>
> On Thu,  2 Oct 2014 15:40:36 -0500, Matt Weber wrote:
> > * Adds powerpc architecture support
> > * Changes to the new github upstream site
> > * Updates the license filename
> >
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >
> > Changes v1 -> v2
> >  - Updated to not change license file. Had looked
> >    a tip not tag for 2.6.0 so it actually didn't
> >    changed in the latest release.(Suggested by Peter K.)
>
> This bump seems to have broken some packages that depend on protobuf:
>
>  * host-protobuf-c-v1.0.0-rc1
>
http://autobuild.buildroot.org/results/647/64707ecd9acfbf519d5f22dd6bd5b39c3b544073/build-end.log
>
>  * python-protobuf-2.6.0
>
http://autobuild.buildroot.org/results/b3b/b3b36c72b233a624ebae9eaac592b7c6fbd394be/build-end.log
>
> Could you have a look?

Sure

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141004/4516aed5/attachment.html>
