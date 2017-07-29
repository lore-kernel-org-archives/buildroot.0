From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 29 Jul 2017 15:52:27 +0300
Subject: [Buildroot] [PATCH 2/4] webkitgtk: Add patches which allow
 building for ARMv8-A
In-Reply-To: <20170728011203.GD32202@momiji>
References: <20170712235531.20444-1-aperez@igalia.com>
 <20170712235531.20444-3-aperez@igalia.com>	<20170721090654.5eb8e26b@windsurf>
 <20170728011203.GD32202@momiji>
Message-ID: <20170729155227.GB12589@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Jul 2017 01:12:03 +0300, Adrian Perez de Castro <aperez@igalia.com> wrote:
> Hello,
> 
> On Fri, 21 Jul 2017 09:06:54 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> > On Thu, 13 Jul 2017 02:55:29 +0300, Adrian Perez de Castro wrote:
> > > The two added patches allow building WebKitGTK+ when the compiler
> > > scpecifically targets ARMv8-A, and reports as such be pre-defining
> > > __ARCH_ARM_8A__ instead of just __ARCH_ARM_8__. Both patches were
> > > pulled from the corresponding upstream bug reports and edited to
> > > remove the conflicting parts which edit the ChangeLog files.
> > > 
> > > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > > ---
> > >  ...ailure-to-build-when-the-compiler-specifica.patch | 20 ++++++++++++++++++++
> > >  ...re-to-build-when-the-compiler-specifically-.patch | 20 ++++++++++++++++++++
> > >  2 files changed, 40 insertions(+)
> > >  create mode 100644 package/webkitgtk/0001-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
> > >  create mode 100644 package/webkitgtk/0002-WTF-Failure-to-build-when-the-compiler-specifically-.patch
> 
> This patch is not needed anymore. The changes are already included in the
> WebKitGTK+ 2.16.6 release.

Actually, it is still needed. I was looking at the 2.17.5 development release
when I wrote my previous e-mail. I'll re-submit it with the patches properly
formatted using ?git format-patch -N?.

Sorry about the confusion :-\


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170729/51269661/attachment.asc>
