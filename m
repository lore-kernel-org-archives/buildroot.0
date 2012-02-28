From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 28 Feb 2012 08:58:23 +0100
Subject: [Buildroot] RC3 ctng toolchain build failure
In-Reply-To: <CAKyeDQ9trStPDomP37wKGCbgobgWmjt6UkG-amrFLOj_KvPcXA@mail.gmail.com>
References: <CAKyeDQ9trStPDomP37wKGCbgobgWmjt6UkG-amrFLOj_KvPcXA@mail.gmail.com>
Message-ID: <4F4C891F.8070207@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

Chris Kerios wrote:
> Doing a vanilla build (nothing other than defaults) on Fedora 14 host
> for a i386/geode target.  No packages added, just brought up make
> xconfig and set for ctng with uclibc for the library and saved.  No
> other settings  were used other than defaults for everything.  Was not
> using ccache either.  Seems it can't find fenv.h for some reason.
> Researched news list and didn't see anything on this except something
> a few months ago about version conflicts and not using ccache.  Also,
> I didn't select to build C++ either.  Any ideas?  Messages below.

Could you please send your Buildroot configuration file (.config)?
When reporting bugs this makes it much easier for other people
to reproduce and investigate the problem.

Luca
