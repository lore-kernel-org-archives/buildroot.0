From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 15:00:11 -0500
Subject: [Buildroot] [PATCH 2/2] package/strongswan: install libcharon
 vici header
In-Reply-To: <20180920211042.29234e83@windsurf>
References: <1537456588-17627-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537456588-17627-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920211042.29234e83@windsurf>
Message-ID: <CANQCQpY7eZ6WfDgm5dHF_8NZRSCzp8tr6pbYdimhTe+S9G+rEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Sep 20, 2018 at 2:10 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 20 Sep 2018 10:16:28 -0500, Matt Weber wrote:
> >  - Adds patch to install 'libvici.h' if
> >    --with-dev-headers is configured.
> >
> > Strongswan  currently installs development headers if
> > '--with-dev-headers' is configured, except 'libvici.h'.
> >
> > Original discussion and commit:
> > https://wiki.strongswan.org/projects/strongswan/repository/revisions/01c2b62362df88a03c53b748bb4e88631410f326
>
> I don't understand: if there is an upstream commit for this that dates
> back from 2 years ago, why do we need to have this patch ?

That commit was never pulled into their master.  It is currently
hanging out on a libvici-dev-header branch.

>
> Also you say "discussion", but I don't see any "discussion" at this URL.
>

Shoot, I meant to include this mailing list link.  It doesn't directly
tie back to the commit on that branch but provides discussion on the
fix.
https://lists.strongswan.org/pipermail/users/2015-September/008777.html

I will respond to my upstream email and include these notes and branch
name.  I should have asked the question about why this has never been
included in a release.

Matt
