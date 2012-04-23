From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 23 Apr 2012 14:46:22 +0200
Subject: [Buildroot] [git commit] docs/header.html: Add link to patchwork
In-Reply-To: <20120421111926.3558596B3A@busybox.osuosl.org>
References: <20120421111926.3558596B3A@busybox.osuosl.org>
Message-ID: <CAAXf6LU6_NP78OFdjqBqgh-_FqOcHzk14SiOa3Q7G3a9veMHVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Apr 21, 2012 at 1:18 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=3d629c405f601bdb9aa7f939f274a52a012e6561
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> ?docs/header.html | ? ?1 +
> ?1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/docs/header.html b/docs/header.html
> index a20f235..ce5d555 100644
> --- a/docs/header.html
> +++ b/docs/header.html
> @@ -55,6 +55,7 @@
> ? ? <br><a href="/docs.html">Documentation</a>
> ? ? <br><a href="/lists.html">Mailing Lists</a>
> ? ? <br><a href="http://autobuild.buildroot.org">Autobuilder</a>
> + ? ?<br><a href="http://patchwork.buildroot.org">Patchwork</a>

I did not see any other mention about this, and haven't been active on
IRC for a while, so I was happily surprised to see this link (actually
it was Yegor's resend of some patches that triggered me, I hadn't seen
this mail yet).

What is the plan exactly?
Everyone can change the state of their own patches, e.g. to indicate
that they intend to send a new version based on feedback. But what
about delegating? When is it done? Will Peter delegate those patches
that he intends to accept to himself, or should developers that
consider their patches as 'final' delegate to Peter ?

Thanks,
Thomas
