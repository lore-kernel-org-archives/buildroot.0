From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 19 Aug 2013 12:35:36 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <20130731191415.545f7dff@skate>
References: <20130731191415.545f7dff@skate>
Message-ID: <5211F4F8.7060800@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni wrote:
> Hello,
>
> We currently have 228 pending patches in our patchwork at
> http://patchwork.ozlabs.org/project/buildroot/list/. Many patches are
> old and should be adopted to be cleaned up and resubmitted, or maybe
> need to be rejected but after some community discussion.
>
> In order to help reducing the backlog of patches, I'm pasting below the
> entire list of patches with their title and direct link to patchwork.
> What I'm interested in is people replying to this e-mail and giving
> their opinion about some of the patches (don't try to look at all of
> them, but at least a few of them). Opinions can be: we should reject,
> I'm interested in adopting the patch and refreshing it, the patch is
> interesting but needs this and that to be merged, etc.
>
> Thanks for your help!
...
> http://patchwork.ozlabs.org/patch/230289 [v2] Enable ccache for cmake packages

This led to a fairly long discussion with Samuel, you and me on howit
should be implemented.You suggested it should be done in the toolchain
wrappers. Thedetails were not clear to me, but it was definitely nothing
similar to this patch.

So probably it should be dropped from patchwork.

Note: the discussion is not fully visible in patchwork, see it here:
http://lists.busybox.net/pipermail/buildroot/2013-March/068306.html

FWIW, I'm not even using that patch. Instead I'm using the v1
(http://lists.busybox.net/pipermail/buildroot/2013-March/068306.html)
which added a stupid shell wrapper around TARGET_CC/_CXX. It's probably
not very nice but it's simple and it just works.

Luca
