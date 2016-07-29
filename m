From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 29 Jul 2016 23:59:23 +0200
Subject: [Buildroot] [git commit] qt5imageformats: fix AArch64 compile
In-Reply-To: <1B400993-7C1D-4BFE-A50F-B8F409D5C310@gmail.com>
References: <20160727130658.364B87FEF0@busybox.osuosl.org>
 <1B400993-7C1D-4BFE-A50F-B8F409D5C310@gmail.com>
Message-ID: <20160729235923.4cb31119@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Khem,

On Wed, 27 Jul 2016 11:14:04 -0700, Khem Raj <raj.khem@gmail.com> wrote:

> > +
> > +-equals(QT_ARCH, arm) {
> > ++equals(QT_ARCH, arm)|equals(QT_ARCH, arm64) {
> 
> not aarch64 ?
> 

I think not, the Qt internal arch identifier is arm64, but aarch64 is used for the toolchain triplet...

Regards,
Peter
