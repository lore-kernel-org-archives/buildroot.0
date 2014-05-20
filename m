From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 20 May 2014 14:57:26 +0000
Subject: [Buildroot] [PATCH] oprofile: bump to version 0.9.9
In-Reply-To: <CAAXf6LWQbOQBDgT7-rEQjT=vxCnJMhm4DDN9AF2r9wbRe1dNHQ@mail.gmail.com>
References: <1400592658-14517-1-git-send-email-abrodkin@synopsys.com>
 <CAAXf6LWQbOQBDgT7-rEQjT=vxCnJMhm4DDN9AF2r9wbRe1dNHQ@mail.gmail.com>
Message-ID: <1400597845.7257.2.camel@abrodkin-8560l>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2014-05-20 at 16:26 +0200, Thomas De Schampheleire wrote:
> On Tue, May 20, 2014 at 3:30 PM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
> 
> > diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
> > index 07a8ec9..b69e974 100644
> > --- a/package/oprofile/oprofile.mk
> > +++ b/package/oprofile/oprofile.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -OPROFILE_VERSION = 0.9.8
> > +OPROFILE_VERSION = 0.9.9
> >  OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
> >  OPROFILE_LICENSE = GPLv2+
> >  OPROFILE_LICENSE_FILES = COPYING
> > @@ -17,6 +17,7 @@ OPROFILE_AUTORECONF = YES
> >  OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
> >  OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
> >  OPROFILE_BINARIES += utils/op-check-perfevents libabi/opimport
> > +OPRIFILE_BINARIES += pe_counting/ocount
> 
> This should be OPROFILE (typo)

Mea culpa, I haven't tried to use this utility on target so this
misspelling was not caught.

Sent v2.

-Alexey
