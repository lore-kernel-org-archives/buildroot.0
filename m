From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 7 Jul 2017 00:27:53 +0300
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
 CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT for ARMv8
In-Reply-To: <20170706232413.526b130d@windsurf.lan>
References: <20170705190840.22469-1-aperez@igalia.com>
 <20170705190840.22469-2-aperez@igalia.com>
 <20170706232413.526b130d@windsurf.lan>
Message-ID: <20170707002753.GB3868@momiji.helsinki.igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 6 Jul 2017 23:24:13 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Hello,
> 
> On Wed,  5 Jul 2017 22:08:40 +0300, Adrian Perez de Castro wrote:
> > This is needed for correctly building some CMake-based packages which
> > use this variable. For example, this is needed for WebKitGTK+ 2.16.x
> > to build correctly when an ARMv8 target is configured.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  package/pkg-cmake.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Applied to master, thanks.
> 
> It is worth mentioning that sending a cover letter for a one patch
> patch series isn't really necessary. If you want to put additional
> information besides the commit log, you can put them after the "---"
> separator below the SoB line.

Ah, I thought that using the ?---? separator was being only used to write the
changes between different versions of the same patch. I will be using it from
now on when sending single patches. Thanks for the tip!

Cheers,

--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170707/2df2fa89/attachment.asc>
