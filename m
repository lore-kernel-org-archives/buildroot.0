From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 19:10:51 +0200
Subject: [Buildroot] [PATCH 4/4] perl-gdgraph: new package
In-Reply-To: <1405691019-10397-4-git-send-email-francois.perrad@gadz.org>
References: <1405691019-10397-1-git-send-email-francois.perrad@gadz.org>
 <1405691019-10397-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140719191051.358726f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 18 Jul 2014 15:43:39 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                    |  1 +
>  package/perl-gdgraph/Config.in       | 12 ++++++++++++
>  package/perl-gdgraph/perl-gdgraph.mk | 14 ++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/perl-gdgraph/Config.in
>  create mode 100644 package/perl-gdgraph/perl-gdgraph.mk

This package does not build:

  http://autobuild.buildroot.org/results/3e1/3e1698b0523dfa46f5b3ee03a22af820f7342c39/build-end.log

The error is:

Warning: prerequisite GD 1.18 not found.
Warning: prerequisite GD::Text 0.80 not found.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
