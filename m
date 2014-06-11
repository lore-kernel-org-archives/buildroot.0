From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jun 2014 22:28:57 +0200
Subject: [Buildroot] [PATCH 1/1] chdkptp CLI added
In-Reply-To: <20140307235055.494ef4e4@skate>
References: <1387798250-2437-1-git-send-email-matthew.j.urry@gmail.com>
 <1387798250-2437-2-git-send-email-matthew.j.urry@gmail.com>
 <20140307235055.494ef4e4@skate>
Message-ID: <20140611222857.4b3700d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matthew,

On Fri, 7 Mar 2014 23:50:55 +0100, Thomas Petazzoni wrote:

> On Mon, 23 Dec 2013 11:30:50 +0000, Matthew Urry wrote:
> > 
> > Signed-off-by: Matthew Urry <matthew.j.urry@gmail.com>
> > ---
> >  package/Config.in                                  |    1 +
> >  package/chdkptp/Config.in                          |   15 +++++++++++
> >  .../chdkptp-01-add_lm_flag_to_makefile.patch       |   15 +++++++++++
> >  ...ptp-02-create_sh_script_to_launch_chdkptp.patch |   22 ++++++++++++++++
> >  package/chdkptp/chdkptp.mk                         |   27 ++++++++++++++++++++
> >  5 files changed, 80 insertions(+)
> >  create mode 100644 package/chdkptp/Config.in
> >  create mode 100644 package/chdkptp/chdkptp-01-add_lm_flag_to_makefile.patch
> >  create mode 100644 package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch
> >  create mode 100644 package/chdkptp/chdkptp.mk
> 
> You received some review on this patch on December, 28th 2013,
> suggesting several improvements to make your patch acceptable upstream.
> Your contributions are definitely welcome, but if you want to get it
> accepted, it'd be nice if you could resend a new version that takes
> into account the comments that have been made.

Since you never came back to the Buildroot community with an updated
patch after about 6 months, despite us giving some review comments, we
will now mark the patch as Rejected.

Of course, if you're still interested in seeing this patch merged,
do not hesitate to send a new iteration that takes into account the
comments that were made.

See http://patchwork.ozlabs.org/patch/304744/ for the review discussion.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
