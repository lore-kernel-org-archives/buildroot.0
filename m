From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 30 Jul 2016 09:00:39 -0500
Subject: [Buildroot] [PATCH v4] iperf: fix "speed" display in csv report
In-Reply-To: <20160730144102.47f40b69@free-electrons.com>
References: <1469750949-64127-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160730144102.47f40b69@free-electrons.com>
Message-ID: <CANQCQpatbauDkX+CmrvZ58+NR3zqZzWi2RmxsXLBsSZVxVa9yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Jul 30, 2016 7:41 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Thu, 28 Jul 2016 19:09:09 -0500, Matt Weber wrote:
> > Some parameters displayed in the CSV reports are declared
> > as uint64_t, but the printf format doesn't reflect this.
> >
> > Submitted bug: https://sourceforge.net/p/iperf/bugs/66/
> >
> > Signed-off-by: Matt Poduska <matt.poduska@rockwellcollins.com>
> > Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
>
> Applied to master, thanks. Could you send the patch to the upstream
> project at https://sourceforge.net/projects/iperf2/. Note: this is a
> different upstream than the one you submitted the patch. The one to
> which you submitted the patch seems to no longer be active. iperf2 is
> active, and has made a release in June 2016.

Will do, thank you for the note!

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160730/c921de01/attachment.html>
