From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 08 Sep 2009 08:58:43 +0200
Subject: [Buildroot] [PATCH 1/5] Remove the "project" feature
In-Reply-To: <20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
	<20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
Message-ID: <1252393123.11390.5.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2009-09-08 at 08:27 +0200, Hans-Christian Egtvedt wrote:
> On Tue,  8 Sep 2009 00:09:49 +0200
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> > The "project" feature was designed to allow to several projects to be
> > built inside the same Buildroot source tree and allowing the toolchain
> > and non-configurable packages to be shared between the different
> > projects on the same architecture. While being interesting in theory,
> > this feature adds a level of complexity to Buildroot, both from an
> > user perspective and from a developer perspective, while one of the
> > main Buildroot strengh is to be simple. Moreover, this feature is only
> > seldomly used by our users.
> >
> 
> I use it all the time ;) How do you propose building for multiple
> targets? I would at least like to share the toolchain, preferably also
> libraries.

Same here. We don't currently use the project feature, but mostly
because we didn't find the time yet to try it. We are building several
targets for the same platform and currently we do a full rebuild for
each target, this includes the toolkit. If there was an easy way to at
least share the tool-chain, then I would welcome if it wasn't removed
from buildroot.


Sven
