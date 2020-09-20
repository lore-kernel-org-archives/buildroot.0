From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 20 Sep 2020 17:19:47 +0200
Subject: [Buildroot] [RFC v1 01/13] package/gst1-interpipe: bump version
 to 94dea52 (1.1.2)
In-Reply-To: <20200920161009.761cb1c4@windsurf>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200920161009.761cb1c4@windsurf>
Message-ID: <20200920171947.158610b7@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 20 Sep 2020 16:10:09 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Wed, 16 Sep 2020 21:49:21 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 4 ++--
> >  package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
>
> Applied to master, thanks. Do you know why we are using some random Git
> commit, while the project has a tag from August 13 this year (version
> 1.1.2) ?

No ;-), would state because of some ancient used version not tagged, but all
buildroot used ones have an corresponding git tag (maybe something dating back
from internal use before submitted to buildroot)..., will change (or at least
try to remember to change it on the next version bump)...

Regards,
Peter

>
> Thomas
