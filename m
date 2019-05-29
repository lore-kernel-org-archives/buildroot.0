From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 29 May 2019 10:03:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/mender: bump version to 2.0
In-Reply-To: <2432947d-67c5-60d5-3174-156522058c7a@mind.be>
References: <20190528115919.26194-1-deinok@deinok.com>
 <CADHdJwDRQe+LkHcTGdgYSJEDxVjBu0Qnj3gY7Zm2mouCCqVs9A@mail.gmail.com>
 <2432947d-67c5-60d5-3174-156522058c7a@mind.be>
Message-ID: <CADHdJwDpOxDOz8tdpFg_tp0yfGVccp_EMft1Z3GLWY86rUBAhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 28, 2019 at 10:39 PM Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 28/05/2019 20:47, Mirza Krak wrote:
> > On Tue, May 28, 2019 at 1:59 PM <deinok@deinok.com> wrote:
> >>
> >> From: deinok <deinok@deinok.com>
> >>
> >> Signed-off-by: deinok <deinok@deinok.com>
> >> ---
> >>  package/mender/Config.in   | 1 +
> >>  package/mender/mender.hash | 2 +-
> >>  package/mender/mender.mk   | 3 ++-
> >>  3 files changed, 4 insertions(+), 2 deletions(-)
> >
> >
> > There is already a patch pending for the 2.0.0 bump, [1].
> >
> > [1]. https://patchwork.ozlabs.org/patch/1097130/
>
>  That one, however, is marked as Changes Requested because it failed to
> explain
> why the license file hashes have changed.
>

Yeah I noticed that, but what I was trying to get at was to try to
coordinate this instead of creating duplicates.


>  Since this patch doesn't even update the license file hashes, I've alse
> marked
> it as changes requested. Hint: test the version bump with 'make
> legal-info'.
>

For info to who ever creates a v2 patch, the license hash change in
mendersoftware/mender is due to a an update to copyright year in the
LICENSE file. The vendor hashes only seem to have different indentation and
that is why git produced a diff, the hashes seem to be the same.

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS <https://northern.tech> | @northerntechHQ
<https://twitter.com/northerntechhq>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190529/cef1c851/attachment.html>
