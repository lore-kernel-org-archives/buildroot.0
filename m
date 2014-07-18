From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 19:51:51 +0200
Subject: [Buildroot] [PATCH 2/4] perl-gd: new package
In-Reply-To: <1405691019-10397-2-git-send-email-francois.perrad@gadz.org>
References: <1405691019-10397-1-git-send-email-francois.perrad@gadz.org>
 <1405691019-10397-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140718195151.540ce6ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 18 Jul 2014 15:43:37 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                           |  1 +
>  package/perl-gd/Config.in                   | 14 ++++++++++
>  package/perl-gd/perl-gd-01-getoptions.patch | 40 +++++++++++++++++++++++++++++
>  package/perl-gd/perl-gd-02-lgd.patch        | 25 ++++++++++++++++++
>  package/perl-gd/perl-gd-03-force.patch      | 29 +++++++++++++++++++++
>  package/perl-gd/perl-gd.mk                  | 22 ++++++++++++++++
>  6 files changed, 131 insertions(+)
>  create mode 100644 package/perl-gd/Config.in
>  create mode 100644 package/perl-gd/perl-gd-01-getoptions.patch
>  create mode 100644 package/perl-gd/perl-gd-02-lgd.patch
>  create mode 100644 package/perl-gd/perl-gd-03-force.patch
>  create mode 100644 package/perl-gd/perl-gd.mk

Thanks, applied, as well as patches 3 and 4.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
