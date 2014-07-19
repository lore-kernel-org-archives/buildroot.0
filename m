From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 16:33:12 +0200
Subject: [Buildroot] [PATCH] perl-gd: fix broken patches
In-Reply-To: <1405779408-29494-1-git-send-email-francois.perrad@gadz.org>
References: <1405779408-29494-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140719163312.4c6579c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat, 19 Jul 2014 16:16:48 +0200, Francois Perrad wrote:
> in each patch, the 3 trailing lines are lost
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-gd/perl-gd-01-getoptions.patch | 3 +++
>  package/perl-gd/perl-gd-02-lgd.patch        | 3 +++
>  package/perl-gd/perl-gd-03-force.patch      | 3 +++
>  3 files changed, 9 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
