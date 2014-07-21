From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Jul 2014 22:07:58 +0200
Subject: [Buildroot] [PATCH] dejavu: new package
Message-ID: <trinity-defeebf5-dd5d-41e0-932a-c62653efa091-1405973278395@3capp-gmx-bs21>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, Jul 19, 2014 at 12:17:05PM +0200, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Wed,  4 Jun 2014 23:07:44 +0200, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/Config.in        |  1 +
> >  package/dejavu/Config.in | 33 +++++++++++++++++++++++++
> >  package/dejavu/dejavu.mk | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 97 insertions(+)
> >  create mode 100644 package/dejavu/Config.in
> >  create mode 100644 package/dejavu/dejavu.mk
> 
> I've applied your patch, after refactoring how the installation is
> done, and changing a little bit the package so that the fontconfig
> files are only installed when the fontconfig package is enabled.
> 
> See
> http://git.buildroot.net/buildroot/commit/?id=8390d939f87581bc216897e6ecd2fded968d5b50
> for the commit.
> 
> Thanks!

More Thanks from my side (specially for the more cleverly implementation)...

Regards,
Peter

> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
