From: Martin Banky <Martin.Banky@gmail.com>
Date: Tue, 13 Aug 2013 03:12:10 -0700
Subject: [Buildroot] [Bug 6404] New: Buildroot's coreutils 'uname -p'
 reports 'Unknown' on recent ARM kernels
In-Reply-To: <20130813112018.7eecafe1@skate>
References: <bug-6404-163@https.bugs.busybox.net/> <5209466E.9030305@mind.be>
 <CAANb1FjeQzEL39+P9ztOxYHHN=L=DYsBVjwAMiduWH_8j+6ZqQ@mail.gmail.com>
 <20130813112018.7eecafe1@skate>
Message-ID: <CAANb1FiNuyFcR4Te--bXp_RcMT78_z-EL3N+eSE8=kYUs2beaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

The issue is, who is responsible for the fix. Coreutils feels it's the
kernel team's issue. They want the sysinfo or sysctl calls implemented. The
kernel team thinks that it's not POSIX compliant, and so they won't
implement it. This is my understanding of the problem. Take a look at the
following thread for one of the discussions.
http://lists.gnu.org/archive/html/bug-coreutils/2005-09/msg00053.html


Martin


On Tue, Aug 13, 2013 at 2:20 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Martin Banky,
>
> On Mon, 12 Aug 2013 17:14:37 -0700, Martin Banky wrote:
> > This is a very long running problem that goes back to at least 2005.
> Google
> > coreutils uname patch, to see the history of this problem. Uname will
> > porbably need a different patch to work on ARM kernels.
>
> If it's such a long-standing issue, why hasn't this never been fixed in
> upstream coreutils? Some disagreement on what the problem is?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130813/b1a4f685/attachment.html>
