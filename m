From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 10:57:15 +0100
Subject: [Buildroot] [PATCH 2/3] qt5: version bump
In-Reply-To: <87a9fwonur.fsf@dell.be.48ers.dk>
References: <1387288651-47952-1-git-send-email-Vincent.Riera@imgtec.com>
 <1387288651-47952-2-git-send-email-Vincent.Riera@imgtec.com>
 <87a9fwonur.fsf@dell.be.48ers.dk>
Message-ID: <20131220105715.4efa4168@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 19 Dec 2013 16:35:24 +0100, Peter Korsgaard wrote:
> >>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > -bump version to 5.2.0
>  > -remove unneeded patches
>  > -remove invalid configure options
> 
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  > ---
>  >  package/qt5/qt5.mk                                 |    4 +-
>  >  ...-Add-egl-cflags-when-opengles2-is-enabled.patch |   32 ----
>  >  .../qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch   |   36 -----
> 
> This patch is still needed.
> 
>  >  package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch |   29 ----
> 
> And so is this.

IMO, this is a good reason, for package bumps, to *require* in the
commit log some details about how patches are updated: why some patches
are removed, some others added, and the others updated. By requiring
this, we will really encourage people to think about the patches, and
provide a justification as to why an existing patch is no longer needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
