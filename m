From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Dec 2015 17:56:40 +0100
Subject: [Buildroot] [PATCH 2/4] docs/website: html cleaning and
 indentation fixing
In-Reply-To: <1449213674-11333-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
 <1449213674-11333-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <56631748.1090002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-12-15 08:21, Angelo Compagnucci wrote:
> * Fixing indentation and cleaning with html tidy
> * Adding tidy_config.txt containing tidy settings
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  docs/website/contribute.html |   74 +-
>  docs/website/docs.html       |  232 +-
>  docs/website/download.html   |  356 +--
>  docs/website/footer.html     |   12 +-
>  docs/website/header.html     |  120 +-
>  docs/website/index.html      |  241 +-
>  docs/website/news.html       | 6342 ++++++++++++++++++++++++------------------
>  docs/website/sponsors.html   |  461 +--
>  docs/website/support.html    |  187 +-
>  docs/website/tidy_config.txt |    5 +
>  10 files changed, 4481 insertions(+), 3549 deletions(-)
>  create mode 100644 docs/website/tidy_config.txt
> 
> diff --git a/docs/website/contribute.html b/docs/website/contribute.html
> index da5700c..5e2e159 100644
> --- a/docs/website/contribute.html
> +++ b/docs/website/contribute.html
> @@ -1,43 +1,43 @@
>  <!--#include file="header.html" -->
> -
>  <div class="container">
> -<div class="row nh">
> -<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
> -
> -  <div class="panel panel-primary">
> -    <div class="panel-heading">Contribute</div>
> -    <div class="panel-body">
> -      <p>Buildroot is an open source project and you are very welcome to contribute to
> -	it.<br />
> -	There are many different ways to contribute:</p>
> -
> -      <ul>
> -	<li>Reproducing, analyzing and fixing bugs from our
> -	  <a href="https://bugs.buildroot.org/">bug tracker</a></li>
> -	<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
> -	    autobuild failures</a></li>
> -	<li>Reviewing and testing patches sent by other developers. See the
> -	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
> -	  </a> or <a href="http://patchwork.ozlabs.org/project/buildroot/list/">
> -	    patchwork</a>.</li>
> -	<li>Working on items from the
> -	  <a href="http://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
> -	<li>Submitting your own patches through the
> -	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
> -	</a></li>
> -      </ul>
> -
> -      <p>For more details on these topics, check out the
> -	<a href="http://buildroot.org/manual.html#_contributing_to_buildroot">
> -	  Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your help!</p>
> -
> -      <p>If you need any support yourself, have a look at <a href="./support.html">
> -	  Support</a>.</p>
> +  <div class="row nh">
> +    <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
> +      <div class="panel panel-primary">
> +        <div class="panel-heading">Contribute</div>
> +        <div class="panel-body">
> +          <p>Buildroot is an open source project and you are very welcome
> +          to contribute to it.
> +          <br />There are many different ways to contribute:</p>
> +          <ul>
> +            <li>Reproducing, analyzing and fixing bugs from our 
> +            <a href="https://bugs.buildroot.org/">bug tracker</a></li>
> +            <li>Analyzing and fixing 
> +            <a href="http://autobuild.buildroot.org/">autobuild
> +            failures</a></li>
> +            <li>Reviewing and testing patches sent by other developers. See
> +            the 
> +            <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">
> +            mailing list</a>or 

 Forget the Ack, there is a space missing here, so possibly in other places as
well... Looks like tidy is not doing the right thing here.


 Regards,
 Arnout

> +            <a href="http://patchwork.ozlabs.org/project/buildroot/list/">
> +            patchwork</a>.</li>
> +            <li>Working on items from the 
> +            <a href="http://www.elinux.org/Buildroot#Todo_list">TODO
> +            list</a></li>
> +            <li>Submitting your own patches through the 
> +            <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">
> +            mailing list</a></li>
> +          </ul>
[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
