From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 06 Jul 2012 00:06:13 +0200
Subject: [Buildroot] [PATCH v3 5/5] Clean up naming of old GENTARGETS
 infrastructure
In-Reply-To: <20120703093348.6c078602@skate>
References: <1341266746-15301-1-git-send-email-arnout@mind.be>
 <1341266873-18680-1-git-send-email-arnout@mind.be>
 <20120703093348.6c078602@skate>
Message-ID: <4FF60FD5.2070909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/12 09:33, Thomas Petazzoni wrote:
> Le Tue,  3 Jul 2012 00:07:53 +0200,
> "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>  a ?crit :
>
> > With the renaming of XXXTARGETS to xxx-package, the names of the
> > pkg-xxx.mk files is inconsistent, as well as some internal names in
> > the documentation.  These inconsistencies are cleaned up here.
> >
> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> >
> > ---
> >   docs/manual/adding-packages-autotools.txt |  169 +++++++++++
> >   docs/manual/adding-packages-cmake.txt     |  141 +++++++++
> >   docs/manual/adding-packages-directory.txt |   12 +-
> >   docs/manual/adding-packages-generic.txt   |  348 ++++++++++++++++++++++
> >   docs/manual/adding-packages.txt           |    6 +-
> >   package/Makefile.in                       |    6 +-
> >   package/pkg-autotools.mk                  |  307 ++++++++++++++++++++
> >   package/pkg-cmake.mk                      |  214 ++++++++++++++
> >   package/pkg-generic.mk                    |  449 +++++++++++++++++++++++++++++
> >   9 files changed, 1640 insertions(+), 12 deletions(-)
>
> I would have expected to see some file deletions (or renames) here. Why
> isn't it so?
>
> Thomas

  Yikes! Looks like a bug in topgit...  I'll resend manually.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
