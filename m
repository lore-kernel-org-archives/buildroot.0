From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue, 13 Feb 2018 22:11:09 +0100
Subject: [Buildroot] [git commit] docs/website/news.html: update for
 2018.02-rc1
In-Reply-To: <20180205162551.1CB0E88432@busybox.osuosl.org>
References: <20180205162551.1CB0E88432@busybox.osuosl.org>
Message-ID: <20180213211109.GA9763@australia.be.alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Feb 05, 2018 at 05:24:11PM +0100, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=f367a2f16504624ccc87f29374044be474b13170
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  docs/website/news.html | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/docs/website/news.html b/docs/website/news.html
> index 59093577c9..e194d68b7e 100644
> --- a/docs/website/news.html
> +++ b/docs/website/news.html
> @@ -9,6 +9,30 @@
>  <h2>News</h2>
>  <ul class="timeline">
>  
> +  <li class="timeline-inverted">
> +    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
> +    <div class="timeline-panel">
> +      <div class="timeline-heading">
> +	<h4 class="timeline-title">2018.02-rc1 released</h4>
> +	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 February 2018</small></p>
> +      </div>
> +      <div class="timeline-body">
> +	<p>We have a new release candidate! Lots of changes all over the
> +	  tree, see the
> +	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02-rc1">CHANGES</a>
> +	  file for details and read the
> +	  <a href="http://lists.busybox.net/pipermail/buildroot/2018-February/213171.html">announcement</a>.
> +	</p>
> +
> +	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
> +	  <a href="/downloads/buildroot-2018.02-rc1.tar.bz2">2018.02-rc1
> +	    release candidate</a>, and report any problems found to the
> +	  <a href="support.html">mailing list</a> or
> +	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
> +      </div>
> +    </div>
> +  </li>
> +
>    <li>
>      <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
>      <div class="timeline-panel">


I don't see this change reflected on the website:
https://buildroot.org/news.html
and likewise, the download page does not show the rc1 tarball.
Seems the update of the website went wrong somewhere?

/Thomas
