From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 03 Oct 2011 18:49:55 +0200
Subject: [Buildroot] [PATCH 1/4] manual: convert existing documentation
 to	the asciidoc format
In-Reply-To: <d871cc9dcec1de13aa412736a1f5f1e6108b8b62.1317326629.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317326629.git.thomas.petazzoni@free-electrons.com>
 <d871cc9dcec1de13aa412736a1f5f1e6108b8b62.1317326629.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4E89E7B3.6060406@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I found a few minor issues that I report below.

In general, I really appreciate this job. BR is growing in features and
complexity, and a single HTML file is not enough anymore. Thanks!

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>


Thomas Petazzoni wrote:
...
> +* *Makefiles for generic packages* (not using autotools): These
> +  are based on an infrastructure similar to the one used for
> +  autotools-based packages, but requires a little more work from the
> +  developer. They specify what should be done for the configuration,
> +  compilation, installation and cleanup of the package. This
> +  infrastructure must be used for all packages that do not use the
> +  autotools as their build system. In the future, other specialized
> +  infrastructures might be written for other build systems.
> +  We cover them through in xref:gentargets-tutorial[] and
> +  xref:gentargets-reference[].
> +

These links do not work.

In the HTML output the link is:
   <a href="#gentargets-reference">[gentargets-reference]</a>
but the target anchor is:
   <h4 id="_tt_gentargets_tt_reference"><tt>GENTARGETS</tt>
     Reference</h4>

In the PDF I read:
   We cover them through in [?] and [?].


> +* *Makefiles for autotools-based software* (autoconf, automake,
> +  etc.): We provide a dedicated infrastructure for such packages, since
> +  autotools is a very common build system. This infrastructure<i>must
> +</i>  be used for new packages that rely on the autotools as their
> +  build system.<br/>We cover them through a
> +<a href="#autotools-tutorial">tutorial</a>  and a
> +<a href="#autotools-reference">reference</a>.</li>

Here are some remnants of the original HTML, I guess.
There are others here and there, but it's trivial to find them by
searching for "<". Most hits are like this one.

Luca
