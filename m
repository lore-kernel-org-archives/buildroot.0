From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 7 Dec 2020 19:44:52 +0100
Subject: [Buildroot] [PATCH/next v1] package/ripgrep: bump version to
 12.1.1
In-Reply-To: <20201205212530.68a9bab3@windsurf.home>
References: <20201202201551.6380-1-ps.report@gmx.net>
 <20201205212530.68a9bab3@windsurf.home>
Message-ID: <20201207194452.1e739746@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 5 Dec 2020 21:25:30 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Wed,  2 Dec 2020 21:15:51 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/ripgrep/ripgrep.hash | 4 ++--
> >  package/ripgrep/ripgrep.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
>
> This bump is already part of my series adding a Cargo package
> infrastructure *and* adding support for Cargo vendoring. And having the
> bump as part of this series is important, as the contents of the
> tarball changes, and therefore its hashes changes, which requires doing
> the bump together with the introduction of Cargo vendoring.
>
> So I'd like to keep the bump part of this series, if you don't mind.

No problem ;-)

Regards,
Peter

>
> Thanks!
>
> Thomas
