From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Tue, 3 Mar 2015 11:00:34 +0100
Subject: [Buildroot] [PATCH v2 1/4] pkg-cmake: allow to build package in
 a subdirectory
In-Reply-To: <CAHXCMM+Vw-njSXvDLMEf-LSwxxDdGY_=g9Yda=2dyfgG=TFmiw@mail.gmail.com>
References: <1424891914-27748-1-git-send-email-gwenj@trabucayre.com>
 <CAHXCMM+Vw-njSXvDLMEf-LSwxxDdGY_=g9Yda=2dyfgG=TFmiw@mail.gmail.com>
Message-ID: <20150303110034.323036d0@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Mon, 2 Mar 2015 22:55:11 +0100
Samuel Martin <s.martin49@gmail.com> wrote:

> Hi Gwenhael,
> 
> On Wed, Feb 25, 2015 at 8:18 PM, Gwenhael Goavec-Merou
> <gwenj@trabucayre.com> wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> >
> > For some cmake based packages, like GNURadio, it's forbidden to do the
> > compilation directly in the sources directory. This patch add a new
> > variable to specify, if needed, the name of a sub-directory used to compile.
> >
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Tested-by: Samuel Martin <s.martin49@gmail.com>
> Acked-by: Samuel Martin <s.martin49@gmail.com>
> 
> It would be good to update the cmake-package section of the manual as well. ;-)
> 
> This doc should mention that the user has to set the build location
> path for the target package, but also for the host package if any.
> I.e.:
> FOO_BUILDDIR = $(FOO_SRCDIR)/.build
> HOST_FOO_BUILDDIR = $(HOST_FOO_SRCDIR)/.build
> 
True. This update needs to be provided by a new version of this series of patch
or a new patch ?
> 
> Regards,
> 
> -- 
> Samuel

Thank for review and test.

Regards

Gwen
