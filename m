From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 16 Nov 2016 08:14:29 +0000
Subject: [Buildroot] [PATCH v2] qt5webkit: Get sources from
 Qt-5-unofficial-builds
In-Reply-To: <4b0fddb6-8bfe-42f2-b710-1bee3d9ff847@andin.de>
References: <1478699994-22351-1-git-send-email-abrodkin@synopsys.com>
 <99688e1c-048d-1831-b402-e23f48fd6e22@ecagroup.com>
 <7ad9c3c6-4739-8b68-400b-97189d630941@mind.be>
 <4b0fddb6-8bfe-42f2-b710-1bee3d9ff847@andin.de>
Message-ID: <1479284015.2530.6.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi?Andreas,

On Wed, 2016-11-16 at 08:53 +0100, Andreas Naumann wrote:
> Am 15.11.2016 um 22:20 schrieb Arnout Vandecappelle:
> > 
> > 
> > 
> > On 15-11-16 15:07, Julien CORJON wrote:
> > > 
> > > Alexey,
> > > 
> > > I like the idea of fetching obsolete submodules from Qt hosting instead
> > > of external github. But, as url say it's snapshot, we will probably have
> > > to change hash file more often... Maybe we will have to get rid of hash
> > > files for theses obsolete submodules.
> > 
> > ?Since the tarballs are actual versioned tarballs, I do hope that they don't
> > just change randomly...
> 
> So my experience was that the tarballs in?
> 5.8.0-beta/latest_src/submodules did actually change until it was?
> properly released. That was the reason i removed the hashes in my bump?
> series (after having refreshed them initially).
> I guess the .../<number>/submodule snapshots are probably more constant?
> during the development phase, but I have no objection to leave the patch?
> as is.

Not really sure. In "numbered" folders I only see pre-built stuff like:
.exe and .dmg

So from what I may see the only source of sources is
5.8/5.8.0-beta/latest_src/.

-Alexey
